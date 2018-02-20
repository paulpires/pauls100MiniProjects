//
//  ViewController.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 19/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class ProjectListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataProvider: DataProvider
    var projectsViewModel: ProjectListViewModel? {
        didSet {
            reloadData()
        }
    }
    
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "100 Days of iOS"
        projectsViewModel = dataProvider.projects()
    }
    
    private func reloadData() {
        // todo: hookup dataprovider, datasource, delegate + cells
    }
}

