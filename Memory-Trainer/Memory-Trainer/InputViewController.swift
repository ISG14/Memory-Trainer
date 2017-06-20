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
    var yPos = 25
    var rowCounter = 0
    var lastTextField: NumInputView!
    var currentTextField: NumInputView!
    
    //OUTLETS
    @IBOutlet weak var scrollView: UIScrollView!
    
    //ACTIONS
    @IBAction func skipButton(_ sender: Any) {
        print(currentTextField.index)
        currentTextField.text = "1"
        moveTextFields(textField: currentTextField)
    }

    //FUNCTIONS
    func firstTextField(){
        xPos = Int((scrollView.bounds.width - 200)/2)
            
        //Create the first text field so that initNumTest can be called whenever
        let numTextField = NumInputView(frame: CGRect(x: xPos, y: yPos, width: 50, height: 50), index: 0)
        scrollView.addSubview(numTextField)
        
        //Set the text field to the first responder and background color to yellow
        numTextField.becomeFirstResponder()
        numTextField.backgroundColor = UIColor(red:1.00, green:1.00, blue:0.00, alpha:0.5)
        
        //Add target to change when one number inputed
        numTextField.addTarget(self, action: #selector(self.moveTextFields), for: UIControlEvents.editingChanged)
        numTextField.addTarget(self, action: #selector(self.changeTextField), for: .editingDidBegin)
        numTextField.addTarget(self, action: #selector(self.endEditTextField), for: .editingDidEnd)
    }
    
    func initNumTestInput(){
        
        xPos += 50
        
        if(rowCounter == 3){
            xPos = Int((scrollView.bounds.width - 200)/2)
            yPos += 50
            rowCounter = -1
        }
        
        //Create a new text field for next number
        let newTextField = NumInputView(frame: CGRect(x: xPos, y: yPos, width: 50, height: 50), index: userGuesses.count + 1)
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
       
        
    }
    
    func endEditTextField(textField: NumInputView){
        textField.backgroundColor = UIColor(red:1.00, green:1.00, blue:0.00, alpha:0)
    }
    
    func changeTextField(textField: NumInputView){
        print("GOT HERE")
        currentTextField = textField
        textField.text = ""
        textField.backgroundColor = UIColor(red:1.00, green:1.00, blue:0.00, alpha:0.5)
    }
    
    func moveTextFields(textField: NumInputView){
        let text = textField.text
        
        if(text?.utf16.count == 1) {
            if(textField.index < userGuesses.count){
                textField.backgroundColor = UIColor(red:1.00, green:1.00, blue:0.00, alpha:0)
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
