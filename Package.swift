// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "DPLocalization",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "DPLocalization", targets: ["DPLocalization"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DPLocalization", dependencies: [], path: "DPLocalization", exclude: ["Example", "Generator"]
        )
    ]
)
