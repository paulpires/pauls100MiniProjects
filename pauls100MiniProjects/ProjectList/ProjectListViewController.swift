//
//  ViewController.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 19/02/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class ProjectListViewController: UIViewController
    , UICollectionViewDelegate
    , UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var collectionView: UICollectionView!
    var projectsViewModel = [ProjectViewModel]() {
        didSet {
            reloadCollectionView()
        }
    }
    private var collectionViewDataSource: ProjectCollectionViewDataSource?
    private var navigationViewController: UINavigationController?
    
    // MARK: - init

    init() {
        super.init(nibName: nil, bundle: nil)
        navigationViewController = UINavigationController(rootViewController: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        projectsViewModel = DataProvider.projects()
        title = "Pauls Mini Projects"
    }
    
    // MARK: - view lifecycle
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func reloadCollectionView() {
        collectionViewDataSource = ProjectCollectionViewDataSource(projectViewModels: projectsViewModel)
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
    private func registerCells() {
        let projectCell = UINib(nibName: "ProjectCollectionViewCell", bundle: nil)
        let projectHeroCell = UINib(nibName: "ProjectHeroCell", bundle: nil)
        collectionView.register(projectCell, forCellWithReuseIdentifier: "ProjectCollectionViewCell")
        collectionView.register(projectHeroCell, forCellWithReuseIdentifier: "ProjectHeroCell")
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let projectViewModel = projectsViewModel[indexPath.row]
        
        switch projectViewModel.viewController {
            
        case .stretchHeader:
            
            let stretchyHeader = StretchyHeaderViewController()
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                               style: .plain,
                                                               target: nil,
                                                               action: nil)
            navigationViewController?.pushViewController(stretchyHeader, animated: true)
            
        case .animatedTabBar:
            
            let animatedTabBar = AnimatedTabBarViewController()
            let view1 = BlankViewController(title: "Bookmarks")
            view1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
            let view2 = BlankViewController(title: "Downloads")
            view2.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
            let view3 = BlankViewController(title: "Contacts")
            view3.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
            let view4 = BlankViewController(title: "More")
            view4.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 3)
            animatedTabBar.viewControllers = [view1, view2, view3, view4]
            navigationViewController?.pushViewController(animatedTabBar, animated: true)
            
        case .wip:
            
            print("doing nothing for now...")
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let horizontalTraitCompact = collectionView.traitCollection.horizontalSizeClass == .compact
        let verticalTraitCompact = collectionView.traitCollection.verticalSizeClass == .compact
        
        if indexPath.section == 0 {
            let heroWidth = collectionView.frame.width
            let heroHeight = (!horizontalTraitCompact && !verticalTraitCompact) ? CGFloat(400) : CGFloat(200)
            return CGSize(width: heroWidth, height: heroHeight)
        }
        
        let minCellWidth: CGFloat = 200.0
        let numberOfColumns = horizontalTraitCompact ? CGFloat(3.0) : CGFloat(5.0)
        var projectCellWidth = collectionView.bounds.width / numberOfColumns
        var projectCellHeight = projectCellWidth
        
        // checking if `projectCellWidth` is a fractional number. If not, then the cells won't fit.
        let isFractionalNumber = projectCellWidth.truncatingRemainder(dividingBy: 1) != 0
        if isFractionalNumber {
            projectCellWidth = collectionView.bounds.width / (numberOfColumns + 1)
            if projectCellWidth < minCellWidth && horizontalTraitCompact {
                projectCellWidth = collectionView.bounds.width / (numberOfColumns - 1)
            }
            projectCellHeight = projectCellWidth
        }
        return CGSize(width: projectCellWidth, height: projectCellHeight)
    }
}
