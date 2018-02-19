//
//  ViewController.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 19/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class ProjectListViewController: UICollectionViewController {

    let dataProvider: DataProvider
    var projectsViewModel: ProjectListViewModel? {
        didSet {
            reloadData()
        }
    }
    
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
        self.collectionView?.collectionViewLayout = UICollectionViewLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        
        self.collectionView?.collectionViewLayout = flowLayout
        
        title = "100 Days of iOS"
        projectsViewModel = dataProvider.projects()
    }
    
    private func reloadData() {
        collectionView?.reloadData()
    }
    
    
}

