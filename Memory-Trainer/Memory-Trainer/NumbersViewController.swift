//
//  NumbersViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/11/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class NumbersViewController: StartViewController {
    
    //VARIABLES
    var digitArray: [String]!
    var row = 23
    var rowPrev = 0
    var digitIndex = 0
    
    //OUTLETS
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var finishedButton: UIButton!
    @IBOutlet weak var numContainerView: UIView!
    
    
    //ACTIONS
    @IBAction func leftButtonPressed(_ sender: Any) {
        if(digitIndex > 50){
            digitIndex -= 96
            initLevel()
        }
    }
    @IBAction func rightButtonPressed(_ sender: Any) {
        if(digitIndex < 960){
            digitIndex += 48
            initLevel()
        }
    }
    @IBAction func finishedButtonPressed(_ sender: Any) {
        timer.invalidate()
    }
    func numberIsPressed(sender: UIButton) {
        //print(sender.currentTitle!)
    }
    
    //FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onStartNumTest()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? InputViewController
        destination?.digitArray = digitArray
    }

    //Hide everything and initialize number array for printing
    func onStartNumTest(){
        //Hide everthing that isnt ready button
        rightButton.center.x += 50
        leftButton.center.x -= 50
        finishedButton.center.y += 50
        
        //Initialize array
        digitArray = [String]()
        for _ in 0...999{
            var digit = ""
            digit += String(arc4random_uniform(UInt32(10)))
            digitArray.append(digit)
        }
        
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
    
    override func initLevel(){
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
                digitIndex += 2
            }
            yPos += heightSpacing + 50.0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
