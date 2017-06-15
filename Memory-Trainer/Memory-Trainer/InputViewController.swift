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
    var yHeight = CGFloat(integerLiteral: 25)
    var moveToNext = 0
    var rowCounter = 1
    
    //OUTLETS
    @IBOutlet weak var inputScrollView: UIScrollView!
    @IBOutlet weak var inputTextField: UITextField!
    
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
        
        //Variables
        var row: UIButton!
        
        //Reset moveToNext after 3 sets of digits so a new button is formed
        if(moveToNext == 3){
            moveToNext = 0
            rowCounter += 1
        }
        
        //If moveToNext is 0 create a new button
        if(moveToNext == 0){
            
            //Increase y-height only when a new button is made
            yHeight += CGFloat(integerLiteral: 50)
            
            //Make a new button for the incoming guess
            row = UIButton(frame: CGRect(origin: self.view.center, size: CGSize(width: 150, height: 50)))
            row.center.x = inputScrollView.bounds.width / 2
            row.center.y = yHeight
            row.tag = rowCounter
            row.setTitle(userGuesses.last!, for: .normal)
            row.setTitleColor(.black, for: .normal)
            self.inputScrollView.addSubview(row)
        } else {
            if let button = self.view.viewWithTag(rowCounter) as? UIButton{
                button.setTitle((button.titleLabel?.text)! + "  \(userGuesses.last!)", for: .normal)
            }
            
        }
        
        moveToNext += 1
        
        //Programatically increase the content size so that it only scrolls when there is enough info
        inputScrollView.contentSize.height = yHeight + 25
        
        //Auto-scroll
        self.inputScrollView.setContentOffset(CGPoint(x: 0, y: self.inputScrollView.contentSize.height - self.inputScrollView.bounds.height), animated: false)
        
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
        
        inputScrollView.contentSize.height = 50
        
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
