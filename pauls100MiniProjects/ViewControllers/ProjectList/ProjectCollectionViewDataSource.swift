//
//  ProjectCollectionViewDatasource.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 20/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class ProjectCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let projectViewModels: [ProjectViewModel]
    
    init(projectViewModels: [ProjectViewModel]) {
        self.projectViewModels = projectViewModels
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return section == 0 ? 1 : projectViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "project_hero_cell", for: indexPath) as? ProjectHeroCell
            cell?.viewModel = ProjectHeroCellViewModel()
            return cell ?? UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "project_cell", for: indexPath) as? ProjectCollectionViewCell
        cell?.viewModel = projectViewModels[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
 
}
