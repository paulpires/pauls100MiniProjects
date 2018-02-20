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
    var projectsViewModel = [ProjectViewModel]() {
        didSet {
            reloadCollectionView()
        }
    }
    
    private var collectionViewDataSource: ProjectCollectionViewDataSource?
    private let dataProvider: DataProvider

    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        title = "100 Days of iOS"
        projectsViewModel = dataProvider.projects()
    }
    
    private func reloadCollectionView() {
        collectionViewDataSource = ProjectCollectionViewDataSource(projectViewModels: projectsViewModel)
        collectionView.dataSource = collectionViewDataSource
        collectionView.reloadData()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "ProjectCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "project_cell")
    }
    
    // todo: collection view delegate call backs
}


