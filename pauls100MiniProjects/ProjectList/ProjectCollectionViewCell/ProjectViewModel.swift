//
//  ProjectListViewModel.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 19/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

enum ViewController
{
    case wip
    case stretchHeader
    case animatedTabBar
}

struct Project
{
    let name: String
    let imageName: String
    let viewController: ViewController
}

struct ProjectViewModel
{
    
    private var projectModel: Project
    var projectName: String
    {
        return projectModel.name
    }
    var viewController: ViewController
    {
        return projectModel.viewController
    }
    
    init(projectModel: Project)
    {
        self.projectModel = projectModel
    }
    
    func projectIcon() -> UIImage?
    {
        return UIImage(named: projectModel.imageName)
    }
}
