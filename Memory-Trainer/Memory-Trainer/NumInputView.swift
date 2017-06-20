//
//  NumInputView.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/19/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class NumInputView: UITextField {

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .blue
        self.textAlignment = .center
        self.textColor = .white
        self.keyboardType = UIKeyboardType.numberPad
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
