// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreAPI",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "CoreAPI", targets: ["CoreAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/ashleymills/Reachability.swift", .upToNextMajor(from: "5.1.0"))
    ],
    targets: [
        .target(name: "CoreAPI", dependencies: [
            .product(name: "RxMoya", package: "Moya"),
            .product(name: "Reachability", package: "Reachability.swift")])
    ]
)
