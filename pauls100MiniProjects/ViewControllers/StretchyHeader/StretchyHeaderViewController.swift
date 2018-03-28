//
//  StretchyHeaderViewController.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 23/03/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class StretchyHeaderViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    let offset_HeaderStop: CGFloat = 40.0
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        edgesForExtendedLayout = []
        scrollView.delegate = self
        tableView.delegate = self
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.shadowImage = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y
        var headerTransform = CATransform3DIdentity
        var tableViewTransform = CATransform3DIdentity
        
        if offset < 0 {
            
            let scaleFactor: CGFloat = abs(offset) / headerView.bounds.height
            let headerHeightIncrease = headerView.bounds.height * (1.0 + scaleFactor) - headerView.bounds.height
            let yVariation = headerHeightIncrease / 2.0
            
            headerTransform = CATransform3DTranslate(headerTransform, 0, yVariation, 0)
            headerTransform = CATransform3DScale(headerTransform, 1.0 + scaleFactor, 1.0 + scaleFactor, 0)
            headerView.layer.transform = headerTransform
            
            tableViewTransform = CATransform3DTranslate(tableViewTransform, 0, abs(offset), 0)
            tableView.layer.transform = tableViewTransform
            
        } else {
            headerTransform = CATransform3DTranslate(headerTransform, 0, -offset, 0)
            headerView.layer.transform = headerTransform
        }
    }
    
    // MARK: tableview delegate
}

