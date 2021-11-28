// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Atelier",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Atelier",
            targets: ["Atelier"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Atelier",
            dependencies: []
        )
    ]
)
