//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by jbjeong on 2023/08/07.
//

import ProjectDescriptionHelpers
import ProjectDescription
import Foundation
import UtilityPlugin

let settings: Settings = .settings(
    base: [:],
    configurations: [
        .debug(name: .debug, settings: Environment.debugSetting),
        .release(name: .release, settings: Environment.releaseSetting)
    ],
    defaultSettings: .recommended
)

let targets: [Target] = [
    .init(
        name: AppEnvironment.TestAApp.targetName,
        platform: .iOS,
        product: .app,
        bundleId: "\(AppEnvironment.TestAApp.bundleID)",
        deploymentTarget: Environment.deploymentTarget,
        infoPlist: .file(path: "Support/Info.plist"),
        sources: ["Sources/**"],
        resources: ["Resources/**"],
        scripts: [.swiftLint],
        dependencies: [
            .Project.Core.ACore,
            .Project.Features.AFeature,
            .Project.UI.Color
        ],
        settings: settings
    )
]

let schemes: [Scheme] = [
    .makeScheme(target: .debug, name: AppEnvironment.TestAApp.targetName),
    .makeScheme(target: .release, name: AppEnvironment.TestAApp.targetName)
]

let project = Project(
    name: AppEnvironment.TestAApp.targetName,
    organizationName: Environment.organizationName,
    settings: settings,
    targets: targets,
    schemes: schemes
)
