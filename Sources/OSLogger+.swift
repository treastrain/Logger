//
//  OSLogger+.swift
//  Logger
//
//  Copyright © 2022 treastrain. All rights reserved.
//

import Foundation

extension os.Logger {
    @inlinable
    public func handleLogger(_ closure: (os.Logger) -> Void) -> os.Logger {
        closure(self)
        return self
    }
    
    @inlinable
    public func handleLogger(_ closure: (os.Logger) throws -> Void) rethrows -> os.Logger {
        try closure(self)
        return self
    }
    
    #if compiler(>=5.5.2) && canImport(_Concurrency)
    @inlinable
    public func handleLogger(_ closure: (os.Logger) async -> Void) async -> os.Logger {
        await closure(self)
        return self
    }
    
    @inlinable
    public func handleLogger(_ closure: (os.Logger) async throws -> Void) async rethrows -> os.Logger {
        try await closure(self)
        return self
    }
    #endif
}
