// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SmoldotSwift",
    platforms: [
        .macOS(.v10_15), .iOS(.v13)
    ],
    products: [
        .library(
            name: "SmoldotSwift",
            targets: ["SmoldotSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/finsig/json-rpc2", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "SmoldotSwift",
            dependencies: [
                "CSmoldot",
                .product(name: "JSONRPC2", package: "json-rpc2"),
            ],
            path: "Sources/SmoldotSwift",
            resources: [
                .process("Resources/polkadot.json"),
                .process("Resources/kusama.json"),
                .process("Resources/rococo.json"),
                .process("Resources/westend.json")]
            ),
        .target(
            name: "CSmoldot",
            dependencies: ["Smoldot"],
            path: "Sources/CSmoldot"),
        
        .binaryTarget(
            name: "Smoldot",
            url: "https://github.com/finsig/smoldot-swift/releases/download/0.1.0/smoldot.xcframework.zip",
            checksum: "7aff9a11e6333d214e8d7975d388766c591e1165506af382c356b3aff6898210"),
        
//        .binaryTarget(name: "Smoldot", path: "Libs/smoldot.xcframework"), // When building the xcframework locally
        
        .testTarget(
            name: "SmoldotSwiftTests",
            dependencies: ["SmoldotSwift"]),
    ]
)
