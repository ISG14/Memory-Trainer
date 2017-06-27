//
//  UserInputViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class UserInputViewController: UIViewController, UITextFieldDelegate {
    
    //VARIABLES
    var userGuesses = [String]()
    var xPos = 0
    var yPos = 25
    var rowCounter = -1
    var lastTextField: NumInputView!
    var currentTextField: NumInputView!
    var scrollView: UIScrollView!
    
    //OUTLETS
    
    //ACTIONS
    @IBAction func skipButton(_ sender: Any) {
        currentTextField.text = " "
        moveTextFields(textField: currentTextField)
    }
    
    //FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func initNumTestInput(){
        
        if(rowCounter == 3){
            xPos = Int((scrollView.bounds.width - 200)/2)
            yPos += 50
            rowCounter = -1
        }
        
        //Create a new text field for next number
        let newTextField = NumInputView(frame: CGRect(x: xPos, y: yPos, width: 50, height: 50), index: userGuesses.count)
        newTextField.becomeFirstResponder()
        newTextField.backgroundColor = UIColor(red:1.00, green:1.00, blue:0.00, alpha:0.5)
        scrollView.addSubview(newTextField)
        newTextField.addTarget(self, action: #selector(self.moveTextFields), for: UIControlEvents.editingChanged)
        newTextField.addTarget(self, action: #selector(self.changeTextField), for: .editingDidBegin)
        newTextField.addTarget(self, action: #selector(self.endEditTextField), for: .editingDidEnd)
        
        //Set last text field to one being made so that it can revert easily after revising others
        lastTextField = newTextField
        currentTextField = newTextField
        
        rowCounter += 1
        
        if(yPos > Int(scrollView.bounds.height-50)){
            //Programatically increase the content size so that it only scrolls when there is enough info
            scrollView.contentSize.height = CGFloat(yPos + 75)
            
            //Auto-scroll
            self.scrollView.setContentOffset(CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.height), animated: true)
            
        }
        
        xPos += 50
    }
    
    func endEditTextField(textField: NumInputView){
        textField.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0)
    }
    
    func changeTextField(textField: NumInputView){
        currentTextField = textField
        textField.text = ""
        textField.backgroundColor = UIColor(red:1.00, green:1.00, blue:0.00, alpha:0.5)
    }
    
    func moveTextFields(textField: NumInputView){
        let text = textField.text
        
        if(text?.utf16.count == 1) {
            if(textField.index < userGuesses.count){
                textField.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0)
                userGuesses[textField.index] = textField.text!
                lastTextField.becomeFirstResponder()
                if(yPos > Int(scrollView.bounds.height-50)){
                    self.scrollView.setContentOffset(CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.height), animated: true)
                }
            }else{
                userGuesses.append(textField.text!)
                textField.backgroundColor = UIColor(red:1.00, green:1.00, blue:0.00, alpha:0)
                initNumTestInput()
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
