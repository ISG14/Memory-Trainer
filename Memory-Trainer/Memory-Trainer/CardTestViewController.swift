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
    @IBOutlet weak var countUpLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var finishedButton: UIButton!
    
    //ACTIONS
    
    
    //FUNCTIONS
    override func unhideAll(){
        //Unhide everything
        UIView.animate(withDuration: 0.7) {
            self.rightButton.center.x -= 50
            self.leftButton.center.x += 50
            self.finishedButton.center.y -= 50
        }
        countUpLabel.isHidden = false
        finishedButton.isHidden = false
    }
    override func countUp() {
        countUpLabel.text = timeString(time: TimeInterval(seconds))
        seconds += 1
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func hideEverything(){
        rightButton.center.x += 50
        leftButton.center.x -= 50
        finishedButton.center.y += 50
        countUpLabel.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        hideEverything()
        
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
