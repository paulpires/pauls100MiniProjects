//
//  Router.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 19/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class Router {
    
    let window: UIWindow
    let dataProvider: DataProvider
    var rootNavigationViewController: UINavigationController?
    
    init(window: UIWindow, dataProvider: DataProvider) {
        self.window = window
        self.dataProvider = dataProvider
    }
    
    func showInitialView() {
        
        let projectsListViewController = ProjectListViewController(dataProvider: dataProvider)
        rootNavigationViewController = UINavigationController(rootViewController: projectsListViewController)
        window.rootViewController = rootNavigationViewController
        window.makeKeyAndVisible()
    }
    
}
