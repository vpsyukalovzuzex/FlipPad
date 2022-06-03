// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Core",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10)
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
        .package(path: "./Support"),
        .package(url: "https://github.com/ccgus/fmdb.git", from: .init(2, 7, 7))
    ],
    targets: [
        .target(
            name: "Core",
            dependencies: [
                .product(
                    name: "Support"
                ),
                .product(
                    name: "FMDB"
                )
            ]
        )
    ]
)
