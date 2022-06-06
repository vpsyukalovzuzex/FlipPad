// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Support",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "Support",
            targets: [
                "Support"
            ]
        )
    ],
    dependencies: [
        // Empty.
    ],
    targets: [
        .target(
            name: "Support"
        )
    ]
)
