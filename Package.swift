// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "DPLocalization",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(
            name: "DPLocalization",
            type: .dynamic,
            targets: ["DPLocalization"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DPLocalization",
            dependencies: [],
            path: "DPLocalization",
            exclude: ["Example", "Generator"]
        )
    ]
)
