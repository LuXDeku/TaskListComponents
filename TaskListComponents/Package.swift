// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TaskListComponents",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "TaskListComponents",
            targets: ["TaskListComponents"]),
    ],
    dependencies: [
        .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk", from: "8.0.0"),
    ],
    targets: [
        .target(
            name: "TaskListComponents",
            dependencies: [
                .product(name: "FirebaseAuth", package: "Firebase"),
            ]),
        .testTarget(
            name: "TaskListComponentsTests",
            dependencies: ["TaskListComponents"]),
    ]
)

