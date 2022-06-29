//
//  MyApp.swift
//  LoggerExample
//
//  Copyright © 2022 treastrain. All rights reserved.
//

import Logger
import SwiftUI

extension Logger {
    static var categoryName1: os.Logger { logger() } // The property name automatically becomes the category name
    static var categoryName2: os.Logger { logger("Category Name 2") } // Customize the category name
}

@main
struct MyApp: App {
    init() {
        Logger.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Text("Hello, logger world!")
                .onAppear {
                    Logger.categoryName1.log(level: .info, "categoryName1's OSLogMessage")
                    // 1998-06-21 09:41:00.000000+0900 LoggerExample[88450:10207919] [categoryName1] categoryName1's OSLogMessage
                    
                    Logger.categoryName2.log(level: .info, "Category Name 2's OSLogMessage")
                    // 1998-06-21 09:41:00.000100+0900 LoggerExample[88450:10207919] [Category Name 2] Category Name 2's OSLogMessage
                    
                    Logger.categoryName1
                        .handleLogger { _ in print("some action") }
                        .log(level: .debug, "categoryName1's OSLogMessage")
                }
        }
    }
}
