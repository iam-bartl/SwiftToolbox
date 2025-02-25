// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftToolbox",
    platforms: [.iOS("16.4"), .macOS("13.3")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "Analytics", targets: ["Analytics"]),
        .library(name: "Device", targets: ["Device"]),
        .library(name: "Helpers", targets: ["Helpers"]),
        .library(name: "Identifier", targets: ["Identifier"]),
        .library(name: "SupportBuilder", targets: ["SupportBuilder"]),
        .library(name: "Views", targets: ["Views"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "Analytics", dependencies: ["Helpers"]),
        .target(name: "Device", dependencies: []),
        .target(name: "Helpers", dependencies: []),
        .target(name: "Identifier", dependencies: []),
        .target(name: "SupportBuilder", dependencies: ["Device"]),
        .target(name: "Views", dependencies: [])
    ]
)
