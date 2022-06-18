// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libgit2-spm-test",
    platforms: [.iOS("15.4"), .macOS(.v12)],
    products: [
        .library(name: "GitTwo", targets: ["GitTwo"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/amine2233/libgit2-spm.git", branch: "feature/add-macos")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .systemLibrary(name: "Cgit2"),
        .target(
            name: "GitTwo",
            dependencies: [
                .target(name: "Cgit2"),
                .product(name: "libgit2", package: "libgit2-spm")
            ],
            linkerSettings: [
                .linkedLibrary("iconv"),
                .linkedLibrary("z")
            ]
        ),
        .testTarget(
            name: "GitTwoTests",
            dependencies: ["GitTwo"]),
    ]
)
