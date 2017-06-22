//
//  CardTestViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/21/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class CardTestViewController: StartViewController {
    
    //VARIABLES
    
    
    //OUTLETS
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var finishedButton: UIButton!
    
    //ACTIONS
    
    
    //FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()

        hideEverything()
        
    }
    
    func hideEverything(){
        rightButton.center.x += 50
        leftButton.center.x -= 50
        finishedButton.center.y += 50
    }
    
    override func unhideAll(){
        //Unhide everything
        UIView.animate(withDuration: 0.7) {
            self.rightButton.center.x -= 50
            self.leftButton.center.x += 50
            self.finishedButton.center.y -= 50
        }
        stopwatchLabel.isHidden = false
        finishedButton.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
