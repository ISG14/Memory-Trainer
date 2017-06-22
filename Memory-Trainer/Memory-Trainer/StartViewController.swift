//
//  StartViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/21/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    //VARIABLES
    var seconds = 5
    var timer: Timer!
    var readyButton: UIButton!
    var timerLabel: UILabel!
    
    //OUTLETS
    
    
    //ACTIONS
    
    
    //FUNCTIONS
    func unhideAll(){
    }
    func countUp(){
    }
    func initLevel(){
    }
    
    func readyButtonPressed(sender: Any) {
        readyButton.isHidden = true
        timerLabel.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(self.countdown)), userInfo: nil, repeats: true)
    }
    
    func countdown(){
        if(seconds == 0){
            timer.invalidate()
            timerLabel.isHidden = true
            unhideAll()
            initLevel()
            //Start timer again for count up
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: #selector(self.countUp), userInfo: nil, repeats: true)
        } else {
            //Countdown Label
            timerLabel.text = "\(seconds)"
            seconds -= 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Ready Button
        readyButton = UIButton(frame: CGRect(origin: self.view.center, size: CGSize(width: 150, height: 100)))
        readyButton.setTitle("Ready", for: .normal)
        readyButton.setTitleColor(.red, for: .normal)
        readyButton.center = self.view.center
        readyButton.center.y -= 40
        readyButton.addTarget(self, action: #selector(readyButtonPressed), for: .touchUpInside)
        self.view.addSubview(readyButton)
        
        //Initialize timer label
        timerLabel = UILabel(frame: CGRect(origin: self.view.center, size: CGSize(width: 200, height: 100)))
        timerLabel.isHidden = true
        timerLabel.textAlignment = NSTextAlignment.center
        timerLabel.textColor = .red
        timerLabel.center = readyButton.center
        self.view.addSubview(timerLabel)
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
