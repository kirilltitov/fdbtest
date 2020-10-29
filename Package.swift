// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "fdbtest",
    platforms: [.macOS(.v10_15)],
    dependencies: [
        .package(url: "https://github.com/kirilltitov/FDBSwift.git", .upToNextMajor(from: "4.0.0")),
    ],
    targets: [
        .target(
            name: "fdbtest",
            dependencies: [
                .product(name: "FDB", package: "FDBSwift"),
            ]
        ),
        .testTarget(
            name: "fdbtestTests",
            dependencies: ["fdbtest"]),
    ]
)
