//
//  ProjectCollectionViewCell.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 20/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    
    var viewModel: ProjectViewModel? {
        didSet {
            updateCell()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func updateCell() {
        icon.image = viewModel?.projectIcon()
        projectName.text = viewModel?.projectName
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.gray.cgColor
    }
}
