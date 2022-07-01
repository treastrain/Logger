//
//  Logger.swift
//  Logger
//
//  Copyright © 2022 treastrain. All rights reserved.
//

import Foundation

public enum Logger {
    public typealias Category = AnyHashable
    
    public static func configure() {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            fatalError("`Bundle.main.bundleIdentifier` is nil. Please pass a valid bundle identifier.")
        }
        configure(bundleIdentifier: bundleIdentifier)
    }
    
    public static func configure(bundleIdentifier: String) {
        guard Self.bundleIdentifier == nil else {
            return logger.log(level: .fault, "Logger's bundle identifier has already been configured. The bundle identifier \(bundleIdentifier, privacy: .public) just given is not set.")
        }
        
        Self.bundleIdentifier = bundleIdentifier
    }
    
    public static func logger(_ category: Category = #function) -> os.Logger {
        if let logger = loggers[category] {
            return logger
        } else {
            guard let bundleIdentifier = bundleIdentifier else {
                fatalError("`bundleIdentifier` has not been set. The default bundle identifier has not yet been configured. Call `Logger.configure()` before calling `Logger.\(#function)`.")
            }
            let logger = os.Logger(subsystem: bundleIdentifier, category: category.description)
            loggers[category] = logger
            return logger
        }
    }
    
    private static var bundleIdentifier: String?
    private static var loggers: [Category : os.Logger] = [:]
    private static var logger: os.Logger { logger() }
}
