//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by jbjeong on 2023/08/07.
//

import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: Environment.workspaceName,
    projects: [
        "Projects/App/**"
    ]
)
