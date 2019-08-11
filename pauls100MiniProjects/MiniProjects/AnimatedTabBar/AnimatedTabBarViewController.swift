//
//  AnimatedTabBarViewController.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 12/05/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class AnimatedTabBarViewController: UITabBarController
{
    let indicator = UIView()
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
        let view1 = BlankViewController(title: "Home", color: .white)
        view1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let view2 = BlankViewController(title: "TV Guide", color: .white)
        view2.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        let view3 = BlankViewController(title: "Browse", color: .white)
        view3.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        let view4 = BlankViewController(title: "Downloads", color: .white)
        view4.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 3)
        let view5 = BlankViewController(title: "Recordings", color: .white)
        view5.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 4)
        viewControllers = [view1, view2, view3, view4, view5]
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tabBar.addSubview(indicator)
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        let tabs = CGFloat(viewControllers?.count ?? 0)
        indicator.frame = CGRect(x: tabBar.bounds.minX, y: tabBar.bounds.minY, width: (tabBar.bounds.width/tabs)*0.9, height: 3)
        indicator.backgroundColor = UIColor(red:0.20, green:0.31, blue:0.61, alpha:1.0)
        indicator.isUserInteractionEnabled = false
        indicator.center.x = tabBar.bounds.width/tabs/2
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem)
    {
        let tabs = CGFloat(viewControllers?.count ?? 0)
        let tabItemSize = tabBar.frame.width/tabs
        let tabIndex = tabBar.items?.firstIndex(of: item) ?? 0
        UIView.animate(withDuration: 0.1) { [weak self] in
            self?.indicator.center.x =  tabItemSize/2 + tabItemSize * CGFloat(tabIndex)
        }
    }
        
}
