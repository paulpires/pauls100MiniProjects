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
    var navigationViewController: UINavigationController?
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
        navigationViewController = UINavigationController(rootViewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        projectsViewModel = dataProvider.projects()
        title = "Pauls Mini Projects"
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func reloadCollectionView() {
        collectionViewDataSource = ProjectCollectionViewDataSource(projectViewModels: projectsViewModel)
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
    private func registerCell() {
        let projectCell = UINib(nibName: "ProjectCollectionViewCell", bundle: nil)
        let projectHeroCell = UINib(nibName: "ProjectHeroCell", bundle: nil)
        collectionView.register(projectCell, forCellWithReuseIdentifier: "project_cell")
        collectionView.register(projectHeroCell, forCellWithReuseIdentifier: "project_hero_cell")
    }
}

extension ProjectListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let projectViewModel = projectsViewModel[indexPath.row]
        
        switch projectViewModel.viewController() {
        
        case .stretchHeader:
            let stretchyHeader = StretchyHeaderViewController()
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            navigationViewController?.pushViewController(stretchyHeader, animated: true)
        case .wip:
            print("doing nothing for now...")
        }
    }
}

extension ProjectListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let horizontalTraitCompact = collectionView.traitCollection.horizontalSizeClass == .compact
        let verticalTraitCompact = collectionView.traitCollection.verticalSizeClass == .compact
        
        if indexPath.section == 0 {
            let width = collectionView.frame.width
            let height = (!horizontalTraitCompact && !verticalTraitCompact) ? CGFloat(400) : CGFloat(200)
            return CGSize(width: width, height: height)
        }
        
        let minCellWidth: CGFloat = 200.0
        let numberOfColumns = horizontalTraitCompact ? CGFloat(3.0) : CGFloat(5.0)
        var width = collectionView.bounds.width / numberOfColumns
        var height = width

        let fitsFlushOnScreen = width.truncatingRemainder(dividingBy: 1) == 0
        if !fitsFlushOnScreen {
            width = collectionView.bounds.width / (numberOfColumns + 1)
            if width < minCellWidth && horizontalTraitCompact {
                width = collectionView.bounds.width / (numberOfColumns - 1)
            }
            height = width
        }
        return CGSize(width: width, height: height)
    }
}
