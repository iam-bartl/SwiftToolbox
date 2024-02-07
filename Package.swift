// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftToolbox",
    platforms: [.iOS("16.4"), .macOS("13.3")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "Device", targets: ["Device"]),
        .library(name: "Identifier", targets: ["Identifier"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "Device", dependencies: []),
        .target(name: "Identifier", dependencies: [])
    ]
)
