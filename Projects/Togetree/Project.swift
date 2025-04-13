import ProjectDescription

private let project = Project(
    name: "Togetree",
    targets: [
        .target(
            name: "Togetree",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.sijun.Togetree",
            infoPlist: .extendingDefault(
                with: [
                    "CFBundleShortVersionString": "1.0.0", // 앱 버전
                    "CFBundleVersion": "1", // 빌드 버전
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                    "UISupportedInterfaceOrientations": [
                        "UIInterfaceOrientationPortrait",
                    ],
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: []
        ),
        .target(
            name: "TogetreeTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.sijun.TogetreeTests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "Togetree")]
        ),
    ]
)
