//
//  InputViewTextField.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/27/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

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
