import ProjectDescription

public extension Project {
    static func makeModule(
        name: String,
        platform: Platform = .iOS,
        product: Product,
        packages: [Package] = [],
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        demoResources: ResourceFileElements? = nil,
        infoPlist: InfoPlist = .default,
        hasDemoApp: Bool = false,
        hasTestTarget: Bool = true,
        hasObjc: Bool = false
    ) -> Project {
        return project(
            name: name,
            platform: platform,
            product: product,
            packages: packages,
            dependencies: dependencies,
            sources: sources,
            resources: resources,
            infoPlist: infoPlist,
            hasDemoApp: hasDemoApp,
            hasTestTarget: hasTestTarget,
            hasObjc: hasObjc
        )
    }
}

public extension Project {
    static func project(
        name: String,
        platform: Platform,
        product: Product,
        organizationName: String = Environment.organizationName,
        packages: [Package] = [],
        deploymentTarget: DeploymentTarget? = Environment.deploymentTarget,
        dependencies: [TargetDependency] = [],
        sources: SourceFilesList,
        resources: ResourceFileElements? = nil,
        demoResources: ResourceFileElements? = nil,
        infoPlist: InfoPlist,
        hasDemoApp: Bool = false,
        hasTestTarget: Bool = true,
        hasObjc: Bool = false
    ) -> Project {
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug, settings: Environment.debugSetting),
                .release(name: .release, settings: Environment.releaseSetting)
            ],
            defaultSettings: .recommended
        )
        
        let appTarget = Target(
            name: name,
            platform: platform,
            product: product,
            bundleId: "\(Environment.organizationName).\(name)",
            deploymentTarget: deploymentTarget,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            scripts: [.swiftLint],
            dependencies: dependencies
        )
        
        let testTarget = Target(
            name: "\(name)Tests",
            platform: platform,
            product: .unitTests,
            bundleId: "\(Environment.organizationName).\(name)Tests",
            deploymentTarget: deploymentTarget,
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: name)
            ]
        )
        
        let schemes: [Scheme] = [.makeScheme(target: .debug, name: name)]
        var targets: [Target]
        
        if hasTestTarget {
            targets = [appTarget, testTarget]
        } else {
            targets = [appTarget]
        }
        
        return Project(
            name: name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
}

public extension Scheme {
    static func makeScheme(target: ConfigurationName, name: String) -> Scheme {
        return Scheme(
            name: "\(name)-\(target == .debug ? "DEBUG" : "RELEASE")",
            shared: true,
            buildAction: .buildAction(targets: ["\(name)"]),
            testAction: target == .release ? .targets(
                ["\(name)Tests"],
                configuration: target,
                options: .options(coverage: true, codeCoverageTargets: ["\(name)"])
            ) : nil,
            runAction: .runAction(configuration: target),
            archiveAction: .archiveAction(configuration: target),
            profileAction: .profileAction(configuration: target),
            analyzeAction: .analyzeAction(configuration: target)
        )
    }
}
