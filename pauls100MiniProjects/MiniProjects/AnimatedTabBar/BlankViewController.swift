//
//  BlankViewController.swift
//  pauls100MiniProjects
//
//  Created by Paul Pires on 12/05/2018.
//  Copyright © 2018 Paul Pires. All rights reserved.
//

import UIKit

class BlankViewController: UIViewController
{
    private let viewControllerTitle: String
    @IBOutlet weak var titleLabel: UILabel!
    {
        didSet
        {
            titleLabel.text = viewControllerTitle
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    init(title: String, color: UIColor = UIColor.random)
    {
        self.viewControllerTitle = title
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = color
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
