// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CryptoEthereumSwift",
    platforms: [
        .macOS(.v10_12),
        .iOS("12")
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "CryptoEthereumSwift",
            targets: ["CryptoEthereumSwift"]),
        .library(name: "CryptoEthereumSwiftPrivate",
            targets: ["CryptoEthereumSwiftPrivate"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMinor(from: "1.4.0")),
        .package(url: "https://github.com/vapor-community/copenssl.git", .exact("1.0.0-rc.1")),
        .package(url: "https://github.com/Boilertalk/secp256k1.swift", .upToNextMinor(from: "0.1.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "CryptoEthereumSwiftPrivate",
            dependencies: ["COpenSSL"],
            path: "Sources",
            exclude: [],
            sources: ["include", "CryptoEthereumSwiftPrivate/Internal.m"],
            publicHeadersPath: "CryptoEthereumSwiftPrivate"
        ),
        .target(
            name: "CryptoEthereumSwift",
            dependencies: ["CryptoEthereumSwiftPrivate", "CryptoSwift", "secp256k1"]),
        .testTarget(
            name: "CryptoEthereumSwiftTests",
            dependencies: ["CryptoEthereumSwift"]),
    ]
)
