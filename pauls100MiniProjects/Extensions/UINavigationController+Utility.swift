//
//  UINavigationController+Utility.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 12/05/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func makeTransparent() {
        navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = UIImage()
    }
    
    func defaultStyling() {
        navigationBar.setBackgroundImage(UINavigationBar.appearance().backgroundImage(for: .default), for:.default)
        navigationBar.isTranslucent = UINavigationBar.appearance().isTranslucent
        navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
    }
}
