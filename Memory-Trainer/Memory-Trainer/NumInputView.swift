//
//  NumInputView.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/19/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class NumInputView: UITextField {
    
    var index: Int!

    init(frame: CGRect, index: Int){
        super.init(frame: frame)
        self.index = index
        self.backgroundColor = .blue
        self.textAlignment = .center
        self.textColor = .white
        self.keyboardType = UIKeyboardType.numberPad
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
