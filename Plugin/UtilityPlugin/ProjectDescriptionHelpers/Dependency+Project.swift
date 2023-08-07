//
//  Dependency+Project.swift
//  ProjectDescriptionHelpers
//
//  Created by jbjeong on 2023/08/07.
//

import ProjectDescription

public extension TargetDependency {
    struct Project {
        public struct Features {}
        public struct Core {}
        public struct UI {}
    }
}

public extension TargetDependency.Project.Features {
    static let AFeature = TargetDependency.feature(name: "AFeature")
}

public extension TargetDependency.Project.Core {
    static let ACore = TargetDependency.core(name: "ACore")
}

public extension TargetDependency.Project.UI {
    static let Color = TargetDependency.ui(name: "Color")
}
