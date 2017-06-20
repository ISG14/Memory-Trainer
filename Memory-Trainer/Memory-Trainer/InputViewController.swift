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
    var digitArray: [String]!
    var xPos = 0
    var yPos = 50
    var rowCounter = 0
    
    //OUTLETS
    @IBOutlet weak var scrollView: UIScrollView!
    
    //ACTIONS
    
    

    //FUNCTIONS
    func firstTextField(){
        xPos = Int((scrollView.bounds.width - 200)/2)
            
        //Create the first text field so that initNumTest can be called whenever
        let numTextField = NumInputView(frame: CGRect(x: xPos, y: 50, width: 50, height: 50))
        scrollView.addSubview(numTextField)
        
        //Set the text field to the first responder and background color to yellow
        numTextField.becomeFirstResponder()
        numTextField.backgroundColor = UIColor(red:1.00, green:1.00, blue:0.00, alpha:0.5)
        
        //Add target to change when one number inputed
        numTextField.addTarget(self, action: #selector(self.moveTextFields), for: UIControlEvents.editingChanged)
        
    }
    
    func initNumTestInput(){
        
        xPos += 50
        
        if(rowCounter == 3){
            xPos = Int((scrollView.bounds.width - 200)/2)
            yPos += 75
            rowCounter = 0
        }
        
        
        //Create a new text field for next number
        let newTextField = NumInputView(frame: CGRect(x: xPos, y: yPos, width: 50, height: 50))
        newTextField.becomeFirstResponder()
        newTextField.backgroundColor = UIColor(red:1.00, green:1.00, blue:0.00, alpha:0.5)
        scrollView.addSubview(newTextField)
        newTextField.addTarget(self, action: #selector(self.moveTextFields), for: UIControlEvents.editingChanged)
        
        rowCounter += 1
        
    }
    
    func moveTextFields(textField: UITextField){
        let text = textField.text
        
        if(text?.utf16.count == 1) {
            userGuesses.append(textField.text!)
            textField.backgroundColor = UIColor(red:1.00, green:1.00, blue:0.00, alpha:0)
            initNumTestInput()
            
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? NumbersCheckViewController
        destination?.userGuesses = userGuesses
        destination?.digitArray = digitArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create first text field
        firstTextField()
    
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
