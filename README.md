# Logger

This package is a thin wrapper for `os.Logger`.

[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/treastrain/Logger/blob/main/LICENSE)
![Platform: iOS 14.0+|iPadOS 14.0+|macOS 11.0+|Mac Catalyst 14.0+|tvOS 14.0+|watchOS 7.0+|](https://img.shields.io/badge/Platform-iOS%2014.0%2B%20%7C%20iPadOS%2014.0%2B%20%7C%20macOS%2011.0%2B%20%7C%20Mac%20Catalyst%2014.0%2B%20%7C%20tvOS%2014.0%2B%20%7C%20watchOS%207.0%2B-lightgrey)
![Swift: 5.5](https://img.shields.io/badge/Swift-5.5-orange.svg)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Xcode Build](https://github.com/treastrain/Logger/actions/workflows/swift.yml/badge.svg)](https://github.com/treastrain/Logger/actions/workflows/swift.yml)

## Usage

1. Define `os.Logger` as an extension of `Logger` with the property name of the string that the system uses to categorize emitted signposts.
1. Call `Logger.configure(bundleIdentifier:)` to set a string that identifies the subsystem that emits signposts.
1. Write a message to the log using `os.Logger` defined in "1."

```swift
import Logger

extension Logger {
    static var categoryName1: os.Logger { logger() } // The property name automatically becomes the category name
    static var categoryName2: os.Logger { logger("Category Name 2") } // Customize the category name
}

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
```
