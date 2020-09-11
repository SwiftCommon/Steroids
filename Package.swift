// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Steroids",
    platforms: [
        // specify each minimum deployment requirement,
        //otherwise the platform default minimum is used.
       .macOS(.v10_12),
       .iOS(.v9),
       .tvOS(.v9),
       .watchOS(.v2)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Steroids",
            targets: ["Steroids"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Swinject/Swinject", from: "2.7.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Steroids",
            dependencies: ["Swinject"]),
        .testTarget(
            name: "SteroidsTests",
            dependencies: ["Steroids"]),
    ],
    swiftLanguageVersions: [.v5]
)
