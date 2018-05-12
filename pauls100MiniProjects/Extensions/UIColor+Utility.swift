//
//  UIColor+Utility.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 12/05/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var random: UIColor {
        let hue: CGFloat = CGFloat(arc4random()).truncatingRemainder(dividingBy: 256) / 256
        let saturation: CGFloat = (CGFloat(arc4random()).truncatingRemainder(dividingBy: 128) / 256) + 0.5
        let brightness: CGFloat = (CGFloat(arc4random()).truncatingRemainder(dividingBy: 128) / 256) + 0.5
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}
