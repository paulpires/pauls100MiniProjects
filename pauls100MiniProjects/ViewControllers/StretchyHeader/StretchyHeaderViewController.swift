//
//  StretchyHeaderViewController.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 23/03/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class StretchyHeaderViewController: UIViewController, UIScrollViewDelegate, UITextViewDelegate {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var textView: UITextView!
    let offset_HeaderStop: CGFloat = 40.0
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.makeTransparent()
        textView.textContainerInset = UIEdgeInsetsMake(140, 0, 0, 0)
        textView.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offset = scrollView.contentOffset.y
        print(offset)
//        var headerTransform = CATransform3DIdentity
////        var tableViewTransform = CATransform3DIdentity
//
//        if offset < 0 {
//            print(offset)
//            let scaleFactor: CGFloat = abs(offset) / headerView.bounds.height
//            let headerHeightIncrease = headerView.bounds.height * (1.0 + scaleFactor) - headerView.bounds.height
//            let yVariation = headerHeightIncrease / 2
//
//            headerTransform = CATransform3DTranslate(headerTransform, 0, yVariation, 0)
//            headerTransform = CATransform3DScale(headerTransform, 1.0 + scaleFactor, 1.0 + scaleFactor, 0)
//            headerView.layer.transform = headerTransform
//
//////            tableViewTransform = CATransform3DTranslate(tableViewTransform, 0, abs(offset), 0)
//////            textView.layer.transform = tableViewTransform
//
//        } else {
//            print("positive")
//            headerTransform = CATransform3DTranslate(headerTransform, 0, -offset, 0)
//            headerView.layer.transform = headerTransform
//        }
    }
}
