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
        title = "100 Mini iOS Projects"
        projectsViewModel = dataProvider.projects()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
//        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func reloadCollectionView() {
        collectionViewDataSource = ProjectCollectionViewDataSource(projectViewModels: projectsViewModel)
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "ProjectCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "project_cell")
    }
}

extension ProjectListViewController: UICollectionViewDelegate {
    
}

extension ProjectListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if indexPath.row == 0 {
            let width = collectionView.frame.width
            let height = width * 0.5
            return CGSize(width: width, height: height)
        }
        
        let numberOfColumns = collectionView.traitCollection.horizontalSizeClass == .compact ? CGFloat(3.0) : CGFloat(5.0)
        var width = collectionView.bounds.width / numberOfColumns
        var height = width
        
        let wholeNumber = width.truncatingRemainder(dividingBy: 1) == 0
        if !wholeNumber {
            // can't device width of screen into 3 whole numbers. flooring the width of the cell will ensure 3 cells get displayed on screen.
            width = floor(collectionView.bounds.width / numberOfColumns)
            height = width
        }
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        let numberOfColumns = collectionView.traitCollection.horizontalSizeClass == .compact ? CGFloat(3.0) : CGFloat(5.0)
        let remainder = (collectionView.bounds.width / numberOfColumns).truncatingRemainder(dividingBy: 1)
        return ceil(remainder)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        let numberOfColumns = collectionView.traitCollection.horizontalSizeClass == .compact ? CGFloat(3.0) : CGFloat(5.0)
        let remainder = (collectionView.bounds.width / numberOfColumns).truncatingRemainder(dividingBy: 1)
        return ceil(remainder)
    }
    
    
}


