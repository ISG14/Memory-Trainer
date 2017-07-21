//
//  InputViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/11/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class InputViewController: UserInputViewController {
    
    //VARIABLES
    var digitArray: [String]!
    
    //OUTLETS
    @IBOutlet weak var levelScrollView: UIScrollView!
    
    
    //ACTIONS
    @IBAction func skipButton(_ sender: Any) {
        currentTextField.text = " "
        moveTextFields(textField: currentTextField)
    }

    //FUNCTIONS
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? NumbersCheckViewController
        destination?.userGuesses = userGuesses
        destination?.digitArray = digitArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = levelScrollView
        setUp(isCardLevel: false)
        initLevel()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
