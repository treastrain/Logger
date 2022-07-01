//
//  Logger.swift
//  Logger
//
//  Copyright © 2022 treastrain. All rights reserved.
//

import Foundation

public enum Logger {
    public typealias Category = AnyHashable
    
    public static func configure(bundleIdentifier: String = Bundle.main.bundleIdentifier!) {
        guard Self.bundleIdentifier == nil else {
            return logger.log(level: .fault, "Logger's bundle identifier has already been configured.")
        }
        
        Self.bundleIdentifier = bundleIdentifier
    }
    
    public static func logger(_ category: Category = #function) -> os.Logger {
        if let logger = loggers[category] {
            return logger
        } else {
            let logger = os.Logger(subsystem: bundleIdentifier, category: category.description)
            loggers[category] = logger
            return logger
        }
    }
    
    private static var bundleIdentifier: String!
    private static var loggers: [Category : os.Logger] = [:]
    private static var logger: os.Logger { logger() }
}
