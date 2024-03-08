import ProjectDescription

let project = Project(
    name: "Tuist One Lab",
    targets: [
        .target(
            name: "Tuist",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.Tuist",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["Tuist/Sources/**"],
            resources: ["Tuist/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "TuistTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TuistTests",
            infoPlist: .default,
            sources: ["Tuist/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Tuist")]
        ),
    ]
)
