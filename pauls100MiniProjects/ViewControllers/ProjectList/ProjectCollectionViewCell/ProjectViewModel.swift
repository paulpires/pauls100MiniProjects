//
//  ProjectListViewModel.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 19/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

struct ProjectViewModel {
    
    private var projectModel: Project
    
    init(projectModel: Project) {
        self.projectModel = projectModel
    }
    
    func project() -> String {
        return projectModel.name
    }
    
    func projectIcon() -> UIImage? {
        return UIImage(named: projectModel.imageName)
    }
}