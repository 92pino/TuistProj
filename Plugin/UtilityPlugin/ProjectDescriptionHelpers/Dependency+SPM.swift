//
//  Dependency+SPM.swift
//  UtilityPlugin
//
//  Created by jbjeong on 2023/08/07.
//

import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension Package {
    static let Alamofire = Package.remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.6.4"))
}

public extension TargetDependency.SPM {
    static let Alamofire = TargetDependency.package(product: "Alamofire")
}
