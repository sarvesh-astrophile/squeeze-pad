// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SqueezeKit",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(name: "SqueezeKit", targets: ["SqueezeKit"])
    ],
    targets: [
        .target(name: "SqueezeKit"),
        .testTarget(name: "SqueezeKitTests", dependencies: ["SqueezeKit"]),
    ]
)
