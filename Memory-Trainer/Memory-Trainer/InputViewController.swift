//
//  InputViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/11/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //VARIABLES
    var pickerDataSource = ["Test"]
    
    //OUTLETS
    @IBOutlet weak var leftTextField: UITextField!
    @IBOutlet weak var middleTextField: UITextField!
    @IBOutlet weak var rightTextField: UITextField!
    @IBOutlet weak var inputPickerView: UIPickerView!
    
    
    //ACTIONS
    
    
    //FUNCTIONS
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //test
        leftTextField.keyboardType = UIKeyboardType.numberPad
        middleTextField.keyboardType = UIKeyboardType.numberPad
        rightTextField.keyboardType = UIKeyboardType.numberPad
        
        //Move text fields out of view to animate in
        leftTextField.center.x -= 150
        rightTextField.center.x += 150
        middleTextField.center.y += 400
        
        //Animate texts fields back in
        UIView.animate(withDuration: 1.5){
            self.leftTextField.center.x += 150
            self.rightTextField.center.x -= 150
            self.middleTextField.center.y -= 400
        }
        
        //test
        self.inputPickerView.dataSource = self;
        self.inputPickerView.delegate = self;
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
