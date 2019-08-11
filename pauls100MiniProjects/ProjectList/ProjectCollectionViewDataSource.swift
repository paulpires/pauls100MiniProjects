//
//  ProjectCollectionViewDatasource.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 20/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class ProjectCollectionViewDataSource: NSObject, UICollectionViewDataSource
{
    private let projectViewModels: [ProjectViewModel]
    
    init(projectViewModels: [ProjectViewModel])
    {
        self.projectViewModels = projectViewModels
    }
    
    // MARK - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return section == 0 ? 1 : projectViewModels.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        if indexPath.section == 0
        {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectHeroCell",
                                                                for: indexPath) as? ProjectHeroCell else
            {
                fatalError("Couldn't dequeue ProjectHeroCell")
            }
            cell.viewModel = ProjectHeroCellViewModel()
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCollectionViewCell",
                                                            for: indexPath) as? ProjectCollectionViewCell else
        {
            fatalError("Couldn't dequeue ProjectCollectionViewCell")
        }
        cell.viewModel = projectViewModels[indexPath.row]
        return cell
    }
}
