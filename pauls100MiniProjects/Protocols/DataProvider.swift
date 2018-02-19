//
//  DataProvider.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 19/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class DataProvider {
    
    func projects() -> ProjectListViewModel {

        let projects = [
            Project(name: "wip", imageName: "wip")
        ]
        return ProjectListViewModel(projects: projects)
    }
}
