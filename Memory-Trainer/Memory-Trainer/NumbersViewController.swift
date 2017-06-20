//
//  NumbersViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/11/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {
    
    //VARIABLES
    var seconds = 0
    var timer: Timer!
    var digitArray: [String]!
    var row = 23
    var rowPrev = 0
    var readyButton: UIButton!
    var timerLabel: UILabel!
    var digitIndex = 0
    
    //OUTLETS
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var timeElapsedLabel: UILabel!
    @IBOutlet weak var finishedButton: UIButton!
    @IBOutlet weak var numContainerView: UIView!
    
    
    //ACTIONS
    @IBAction func leftButtonPressed(_ sender: Any) {
        if (digitIndex > 30){
            digitIndex -= 48
            initNumTest()
        }
    }
    @IBAction func rightButtonPressed(_ sender: Any) {
        if (digitIndex < 980){
            initNumTest()
        }
    }
    @IBAction func finishedButtonPressed(_ sender: Any) {
        timer.invalidate()
    }
    func readyButtonPressed(sender: Any) {
        readyButton.isHidden = true
        timerLabel.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(self.countdown)), userInfo: nil, repeats: true)
    }
    func numberIsPressed(sender: UIButton) {
        //print(sender.currentTitle!)
    }
    
    //FUNCTIONS
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? InputViewController
        destination?.digitArray = digitArray
    }
    
    
    func countdown(){
        if(seconds == 0){
            timer.invalidate()
            timerLabel.isHidden = true
            unhideAll()
            initNumTest()
            //Start timer again for count up
            timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(self.countup)), userInfo: nil, repeats: true)
        } else {
            //Countdown Label
            timerLabel.text = "\(seconds)"
            seconds -= 1
        }
    }
    
    func countup(){
        timeElapsedLabel.text = timeString(time: TimeInterval(seconds))
        seconds += 1
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func unhideAll(){
        //Unhide everything
        UIView.animate(withDuration: 0.7) {
            self.rightButton.center.x -= 50
            self.leftButton.center.x += 50
            self.finishedButton.center.y -= 50
        }
        timeElapsedLabel.isHidden = false
        finishedButton.isHidden = false
    }
    
    func initNumTest(){
        
        //Clear buttons so they dont overlap when the function is called again
        for view in numContainerView.subviews{
            view.removeFromSuperview()
        }
        
        //Variables
        var button: UIButton!
        let containerSize = self.numContainerView.bounds
        let width = containerSize.width
        let height = containerSize.height
        
        //Spacing
        let widthSpacing = (width - 150)/6
        let heightSpacing = (height - 400)/9
        var yPos = heightSpacing
        
        for _ in 0...7 {
            var xPos = widthSpacing*2
            for _ in 0...2 {
                button = UIButton(frame: CGRect(x: xPos, y: yPos, width: 50, height: 50))
                button.setTitle(digitArray[digitIndex] + digitArray[digitIndex+1], for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.addTarget(self, action: #selector(numberIsPressed), for: .touchUpInside)
                self.numContainerView.addSubview(button)
                xPos += widthSpacing + 50.0
                digitIndex += 1
            }
            yPos += heightSpacing + 50.0
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Hide everthing that isnt ready button
        rightButton.center.x += 50
        leftButton.center.x -= 50
        finishedButton.center.y += 50
        timeElapsedLabel.isHidden = true
        
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
        
        //Initialize array
        digitArray = [String]()
        for _ in 0...999{
            var digit = ""
            digit += String(arc4random_uniform(UInt32(10)))
            digitArray.append(digit)
        }
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
