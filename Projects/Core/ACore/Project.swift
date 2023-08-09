//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by jbjeong on 2023/08/07.
//

import ProjectDescription
import ProjectDescriptionHelpers
import UtilityPlugin

let project = Project.makeModule(
    name: "ACore",
    product: .framework,
    packages: [
        // 패키지 등록
        .Alamofire
    ],
    dependencies: [
        // 의존성 등록
        .SPM.Alamofire
    ]
)
