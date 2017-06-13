//
//  InputViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/11/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {
    
    //VARIABLES
    var userGuesses = [String]()
    var separator = 0
    
    //OUTLETS
    @IBOutlet weak var inputScrollView: UIScrollView!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var guessLabel: UILabel!
    
    //ACTIONS
    
    
    //FUNCTIONS
    func moveToScrollView (textField: UITextField){
        
        let text = textField.text
        
        if(text?.utf16.count == 2) {
            userGuesses.append(textField.text!)
            inputTextField.text = ""
            addToScrollView()
        }
    }
    
    func addToScrollView(){
        guessLabel.text = (guessLabel.text ?? "") + userGuesses.last! + " "
        separator += 1
        if (separator == 3){
            guessLabel.text = (guessLabel.text ?? "") + "\n"
            separator = 0
        }
        
        guessLabel.sizeToFit()
        guessLabel.frame = CGRect(x: 0, y: 8, width: inputScrollView.bounds.width, height: guessLabel.bounds.height)
    
        inputScrollView.contentSize.height = guessLabel.bounds.height + 10
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign numpad to textfield
        inputTextField.keyboardType = UIKeyboardType.numberPad
        
        //Set up text field to only take 2 digits
        inputTextField.delegate = self
        inputTextField.addTarget(self, action: #selector(self.moveToScrollView), for: UIControlEvents.editingChanged)
        
        //Bring up keyboard to start
        inputTextField.becomeFirstResponder()
        
        inputScrollView.contentSize.height = 1000
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
