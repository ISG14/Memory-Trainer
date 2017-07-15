//
//  NumbersCheckViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/15/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class NumbersCheckViewController: CheckViewController{
    
    //VARIABLES
    
    //OUTLETS
    @IBOutlet weak var numCheckScrollView: UIScrollView!
    @IBOutlet weak var numCorrectLabel: UILabel!
    @IBOutlet weak var numIncorrectLabel: UILabel!
    
    //ACTIONS
    
    //FUNCTIONS
    override func viewDidLoad() {
        
        checkScrollView = numCheckScrollView
        correctLabel = numCorrectLabel
        incorrectLabel = numIncorrectLabel
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
