//
//  Environment.swift
//  ProjectDescriptionHelpers
//
//  Created by jbjeong on 2023/08/07.
//

import ProjectDescription
import Foundation

public enum Environment {
    public static let workspaceName = "TuistDemo"
    
    public static let organizationName = "dev.Ethan"
    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "14.0", devices: [.iphone, .ipad])
    
    public static let debugSetting: SettingsDictionary = SettingsDictionary()
    public static let releaseSetting: SettingsDictionary = SettingsDictionary()
}

public enum AppEnvironment {
    case TestAApp
    
    public var targetName: String {
        switch self {
        case .TestAApp:
            return "A_App"
        }
    }
    
    public var bundleID: String {
        switch self {
        case .TestAApp:
            return "app.test.A"
        }
    }
}
