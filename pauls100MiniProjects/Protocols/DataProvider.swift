//
//  DataProvider.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 19/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class DataProvider {
    
    func projects() -> [ProjectViewModel] {

        return [
            Project(name: "Stretchy Header", imageName: "stretchy_header", viewController: .stretchHeader),
            Project(name: "coming soon...", imageName: "wip", viewController: .wip)
        ].map {
            return ProjectViewModel(projectModel: $0)
        }
    }
}
