//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by jbjeong on 2023/08/07.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Color",
    product: .framework,
    packages: [],
    dependencies: [],
    hasTestTarget: false
)
