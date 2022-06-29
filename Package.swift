// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "Logger",
    platforms: [.iOS(.v14), .macOS(.v11), .macCatalyst(.v14), .tvOS(.v14), .watchOS(.v7)],
    products: [
        .library(
            name: "Logger",
            targets: ["Logger"]),
    ],
    targets: [
        .target(
            name: "Logger",
            path: "Sources"),
    ]
)
