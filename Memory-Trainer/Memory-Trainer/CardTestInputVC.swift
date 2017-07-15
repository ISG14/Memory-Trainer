//
//  CardTestInputVC.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 7/15/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class CardTestInputVC: UserInputViewController {
    
    //VARIABLES
    var cardOrder: [Int]!
    
    //OUTLETS
    @IBOutlet weak var levelScrollView: UIScrollView!
    @IBOutlet weak var skipButton: UIButton!
    
    //ACTIONS
    @IBAction func skipButtonPressed(_ sender: Any) {
        currentTextField.text = " "
        moveTextFields(textField: currentTextField)
    }
    
    //FUNCTIONS

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView = levelScrollView
        referenceButton = skipButton
        setUp(isCardLevel: true)
        initLevel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
