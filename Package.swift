// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Grape",

    platforms: [
        .macOS(.v13),
    ],

    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .executable(name: "reg", targets: ["reg"]),

    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: "https://github.com/pvieito/PythonKit.git", .branch("master")),
    ],

    targets: [
        
        .executableTarget(
            name: "reg",
            path: "./regex"
        ),
    ]
)
