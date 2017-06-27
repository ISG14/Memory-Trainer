//
//  CardInputViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class CardInputViewController: UserInputViewController {
    
    //VARIABLES
    var cardOrder: [Int]!
    
    //OUTLETS
    @IBOutlet weak var levelScrollView: UIScrollView!
    
    
    //ACTIONS
    @IBAction func skipButtonPressed(_ sender: Any) {
        currentTextField.text = " "
        moveTextFields(textField: currentTextField)
    }
    
    //FUNCTIONS
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView = levelScrollView
        xPos = Int((scrollView.bounds.width - 200)/2)
        
        useNumpad = false
        
        initLevel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
