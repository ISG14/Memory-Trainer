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
    var lastTextField: InputViewTextField!
    var currentTextField: InputViewTextField!
    var scrollView: UIScrollView!
    var useNumpad = true
    var referenceButton: UIButton!
    var numToEnter: Int!
    
    //OUTLETS
    
    
    //ACTIONS
    func cardKeyboardButtonPressed(button: UIButton){
        if(button.title(for: .normal) == "10"){
            numToEnter = 3
        }
        currentTextField.text = currentTextField.text! + button.title(for: .normal)!
        moveTextFields(textField: currentTextField)
        
    }
    
    func endEditTextField(textField: InputViewTextField){
        textField.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0)
    }
    
    func changeTextField(textField: InputViewTextField){
        currentTextField = textField
        textField.text = ""
        textField.backgroundColor = UIColor(red:1.00, green:1.00, blue:0.00, alpha:0.5)
    }
    
    func moveTextFields(textField: InputViewTextField){
        let text = textField.text
        
        if(text?.utf16.count == numToEnter) {
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
                initLevel()
            }
            numToEnter = 2
        }
    }
    
    //FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setUp(isCardLevel: Bool){
        if(isCardLevel == true){
            xPos = Int((scrollView.bounds.width - 200)/2)
            useNumpad = false
            createCardKeyboard()
            numToEnter = 2
        }else{
            xPos = Int((scrollView.bounds.width - 200)/2)
            numToEnter = 1
        }
    }
    
    func createCardKeyboard(){
        //CardKeyboard.createCardKeyboard(view: self, refButton: referenceButton)
        
        //VARIABLES
        var keyboardOrder = ["D", "S", "H", "C", "K", "Q", "J", "10", "9", "8", "7", "6", "5", "4", "3", "2", "A"]
        //Create view to hold card keyboard
        print(referenceButton.bounds.height/2.0)
        let cardKeyboardContainer = UIView(frame: CGRect(x: 0, y: (Double(referenceButton.center.y))-15, width: Double(self.view.bounds.width), height: (Double(self.view.bounds.height)-Double(referenceButton.center.y)-50)))
        cardKeyboardContainer.backgroundColor = .black
        self.view.addSubview(cardKeyboardContainer)
        //Establish first and second width spacing and height spacing
        let firstWidthSpacing = (Double(cardKeyboardContainer.bounds.width)-160.0)/7.0
        let secondWidthSpacing = (Double(cardKeyboardContainer.bounds.width)-160.0)/11.0
        let heightSpacing = (Double(cardKeyboardContainer.bounds.height) - 200)/6.0
        var yPos = heightSpacing
        
        //Create for loop for card number/face
        for _ in 0...2{
            var xPos1 = firstWidthSpacing*2.0
            for _ in 0...3{
                //Create button
                let button = UIButton(frame: CGRect(x: xPos1, y: yPos, width: 40.0, height: 40.0))
                button.setTitle(keyboardOrder.popLast(), for: .normal)
                button.tag = keyboardOrder.count
                button.addTarget(self, action: #selector(cardKeyboardButtonPressed), for: .touchUpInside)
                button.backgroundColor = .red
                cardKeyboardContainer.addSubview(button)
                xPos1 += firstWidthSpacing + 40
            }
            yPos += heightSpacing + 40
        }
        //Create king button in middle of row
        let button = UIButton(frame: CGRect(x: Double(cardKeyboardContainer.bounds.width/2)-20, y: yPos, width: 40.0, height: 40.0))
        button.setTitle(keyboardOrder.popLast(), for: .normal)
        button.tag = keyboardOrder.count
        button.addTarget(self, action: #selector(cardKeyboardButtonPressed), for: .touchUpInside)
        button.backgroundColor = .red
        cardKeyboardContainer.addSubview(button)
        yPos += heightSpacing + 40
        //Create for loop for card suits
        var xPos = secondWidthSpacing*4
        for _ in 0...3{
            let button = UIButton(frame: CGRect(x: xPos, y: yPos, width: 40.0, height: 40.0))
            button.setTitle(keyboardOrder.popLast(), for: .normal)
            button.tag = keyboardOrder.count
            button.addTarget(self, action: #selector(cardKeyboardButtonPressed), for: .touchUpInside)
            button.backgroundColor = .red
            cardKeyboardContainer.addSubview(button)
            xPos += secondWidthSpacing+40
        }
    }
    
    func initLevel(){
        
        if(rowCounter == 3){
            xPos = Int((scrollView.bounds.width - 200)/2)
            yPos += 50
            rowCounter = -1
        }
        
        //Create a new text field for next number
        let newTextField = InputViewTextField(frame: CGRect(x: xPos, y: yPos, width: 50, height: 50), index: userGuesses.count, Boolean: useNumpad)
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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class InputViewTextField: UITextField {
    
    var index: Int!
    var useNumpad = true
    
    
    init(frame: CGRect, index: Int, Boolean: Bool){
        super.init(frame: frame)
        self.index = index
        useNumpad = Boolean
        self.backgroundColor = .blue
        self.textAlignment = .center
        self.textColor = .white
        if(useNumpad == true){
            self.keyboardType = UIKeyboardType.numberPad
        }else{
            self.inputView = UIView()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
