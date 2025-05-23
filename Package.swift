// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftToolbox",
    platforms: [.iOS("17.0"), .macOS("15.0")],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "Analytics", targets: ["Analytics"]),
        .library(name: "Device", targets: ["Device"]),
        .library(name: "Helpers", targets: ["Helpers"]),
        .library(name: "Identifier", targets: ["Identifier"]),
        .library(name: "ImagePickers", targets: ["ImagePickers"]),
        .library(name: "ImageType", targets: ["ImageType"]),
        .library(name: "SupportBuilder", targets: ["SupportBuilder"]),
        .library(name: "SwiftToolboxViews", targets: ["SwiftToolboxViews"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "Analytics", dependencies: ["Helpers"]),
        .target(name: "Device", dependencies: []),
        .target(name: "Helpers", dependencies: []),
        .target(name: "Identifier", dependencies: []),
        .target(name: "ImagePickers", dependencies: [
            "ImageType"
        ]),
        .target(name: "ImageType", dependencies: []),
        .target(name: "SupportBuilder", dependencies: ["Device"]),
        .target(name: "SwiftToolboxViews", dependencies: [])
    ]
)
