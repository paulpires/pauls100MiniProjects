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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return projectViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "project_cell", for: indexPath) as? ProjectCollectionViewCell
        cell?.viewModel = projectViewModels[indexPath.row]
        cell?.layer.borderWidth = 0.5
        cell?.layer.borderColor = UIColor.gray.cgColor
        return cell ?? UICollectionViewCell()
    }
 
}
