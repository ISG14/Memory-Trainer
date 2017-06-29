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
    var seconds = 0
    var timer: Timer!
    var readyButton: UIButton!
    var timerLabel: UILabel!
    var stopwatchLabel: UILabel!
    
    //OUTLETS
    
    
    //ACTIONS
    
    
    //FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()

        //Initialize ready Button
        readyButton = UIButton(frame: CGRect(origin: self.view.center, size: CGSize(width: 150, height: 100)))
        readyButton.setTitle("Ready", for: .normal)
        readyButton.setTitleColor(.red, for: .normal)
        readyButton.center.x = self.view.bounds.width/2
        readyButton.center.y = self.view.bounds.height/2
        readyButton.addTarget(self, action: #selector(readyButtonPressed), for: .touchUpInside)
        self.view.addSubview(readyButton)
        
        //Initialize countdown label
        timerLabel = UILabel(frame: CGRect(origin: self.view.center, size: CGSize(width: 200, height: 100)))
        timerLabel.isHidden = true
        timerLabel.textAlignment = NSTextAlignment.center
        timerLabel.textColor = .red
        timerLabel.center = readyButton.center
        self.view.addSubview(timerLabel)
        
        //Initialize stopwatch label
        stopwatchLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width*0.76, height: self.view.bounds.height*0.06301824212))
        stopwatchLabel.center.x = self.view.center.x
        stopwatchLabel.textAlignment = NSTextAlignment.center
        stopwatchLabel.textColor = .white
        stopwatchLabel.backgroundColor = UIColor(red:0.08, green:0.58, blue:0.81, alpha:1.0)
        stopwatchLabel.text = "00:00:00"
        stopwatchLabel.isHidden = true
        self.view.addSubview(stopwatchLabel)
        
    }
    
    func unhideAll(){
    }
    func initLevel(){
    }
    
    func countUp(){
        stopwatchLabel.text = timeString(time: TimeInterval(seconds))
        seconds += 1
    }
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
