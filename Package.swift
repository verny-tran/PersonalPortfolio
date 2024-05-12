// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PersonalPortfolio",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "PersonalPortfolio",
            targets: ["PersonalPortfolio"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.8.0")
    ],
    targets: [
        .executableTarget(
            name: "PersonalPortfolio",
            dependencies: ["Publish"]
        )
    ]
)