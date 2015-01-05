//
//  ViewController.swift
//  Todolist
//
//  Created by Giordano Scalzo on 02/01/2015.
//  Copyright (c) 2015 Effective Code Ltd. All rights reserved.
//

import UIKit
import LatoFont

class ViewController: UIViewController {
    @IBOutlet weak var hairlineLabel: UILabel!
    @IBOutlet weak var hairlineItalicLabel: UILabel!
    @IBOutlet weak var lightLabel: UILabel!
    @IBOutlet weak var lightItalicLabel: UILabel!
    @IBOutlet weak var regularLabel: UILabel!
    @IBOutlet weak var italicLabel: UILabel!
    @IBOutlet weak var boldLabel: UILabel!
    @IBOutlet weak var boldItalicLabel: UILabel!
    @IBOutlet weak var blackLabel: UILabel!
    @IBOutlet weak var blackItalicLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let size = CGFloat(17.0)
        
        self.hairlineLabel.font = UIFont.latoHairlineFontOfSize(size)
        self.hairlineItalicLabel.font = UIFont.latoHairlineItalicFontOfSize(size)

        self.lightLabel.font = UIFont.latoLightFontOfSize(size)
        self.lightItalicLabel.font = UIFont.latoLightItalicFontOfSize(size)
        
        self.regularLabel.font = UIFont.latoFontOfSize(size)
        self.italicLabel.font = UIFont.latoItalicFontOfSize(size)
        
        self.boldLabel.font = UIFont.latoBoldFontOfSize(size)
        self.boldItalicLabel.font = UIFont.latoBoldItalicFontOfSize(size)
        
        self.blackLabel.font = UIFont.latoBlackFontOfSize(size)
        self.blackItalicLabel.font = UIFont.latoBlackItalicFontOfSize(size)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

