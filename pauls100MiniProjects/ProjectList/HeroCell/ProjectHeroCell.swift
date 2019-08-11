//
//  ProjectHeroCell.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 18/03/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class ProjectHeroCell: UICollectionViewCell
{
    @IBOutlet weak var heroImage: UIImageView!
    
    var viewModel: ProjectHeroCellViewModel?
    {
        didSet
        {
            updateCell()
        }
    }
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    private func updateCell()
    {
        heroImage.image = viewModel?.heroImage()
    }
}
