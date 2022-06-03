// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "Core",
            targets: [
                "Core"
            ]
        )
    ],
    dependencies: [
        // Empty.
    ],
    targets: [
        .target(
            name: "Core"
        )
    ]
)
