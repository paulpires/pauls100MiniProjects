//
//  StretchyHeaderViewController.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 23/03/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class StretchyHeaderViewController
    : UIViewController
    , UIScrollViewDelegate
    , UITextViewDelegate
{
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    init()
    {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationController?.makeTransparent()
        
        headerView.clipsToBounds = false
        headerView.isUserInteractionEnabled = false
        
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = .scaleAspectFill
        
        textView.delegate = self
        textView.contentInsetAdjustmentBehavior = .never
        textView.contentInset = UIEdgeInsets(top: headerView.frame.maxY, left: 0, bottom: 0, right: 0)
        textView.scrollIndicatorInsets = UIEdgeInsets(top: headerView.frame.maxY, left: 0, bottom: 0, right: 0)
        textView.isEditable = false
        textView.text = StretchyHeaderViewController.text + StretchyHeaderViewController.text
        textView.alwaysBounceVertical = true
    }   
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        textView.contentOffset = CGPoint(x: 0, y: -headerView.frame.maxY)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let y = scrollView.contentOffset.y * -1
        let navigationBarHeight = (navigationController?.navigationBar.frame.height ?? 44) + UIApplication.shared.statusBarFrame.height
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: max(y, navigationBarHeight))
    }
    
    static let text = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.

    Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?

    """
}
