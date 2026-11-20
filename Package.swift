// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasCore",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasCore", targets: ["Yodo1MasCoreTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Yodo1Games/YDYThinking-SDK-Swift-Package.git", exact: "2.8.0-release.4"),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", exact: "1.38.3"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", exact: "3.1.0"),
    ],
    targets: [
        // ==================== Yodo1MasCore ====================
        .target(
            name: "Yodo1MasCoreTarget",
            dependencies: [
                .target(name: "Yodo1MasCore"),
                .product(name: "GoogleUserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
                .product(name: "AppHarbrSDK", package: "AppHarbrSDK"),
                .product(name: "YDYThinkingSDK", package: "YDYThinking-SDK-Swift-Package"),
            ],
            path: "Sources/Yodo1MasCoreTarget",
            resources: [.copy("Yodo1MasCore.bundle"), .copy("Yodo1MasCore.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasCore",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasCore/Yodo1MasCore-5.0.0-beta.5.zip",
            checksum: "df50f9e8a534a394df1f452d7a7f2d1b6f73b9152d8a55cbf6df0a1dea8331d6"
        ),
    ]
)
