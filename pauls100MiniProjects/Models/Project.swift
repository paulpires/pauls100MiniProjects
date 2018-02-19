//
//  File.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 19/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

struct Project {
    
    let name: String
    let imageName: String
    lazy var icon: UIImage? = UIImage(named: self.imageName)
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}
