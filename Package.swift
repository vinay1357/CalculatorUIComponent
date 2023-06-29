// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CalculatorUIComponent",
    platforms: [
           .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CalculatorUIComponent",
            targets: ["CalculatorUIComponent"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vinay1357/ThemeKit.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CalculatorUIComponent",
            dependencies: [
                .product(name: "ThemeKit", package: "ThemeKit", condition: nil),
            ]),
        
        .testTarget(
            name: "CalculatorUIComponentTests",
            dependencies: ["CalculatorUIComponent"]),
    ]
)
