//
//  CardTestVC.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 7/14/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class CardTestVC: StartViewController {
    
    //VARIABLES
    var cardWidth = 0.0
    var cardHeight = 0.0
    var cardOrder: [Int]!
    var indexToPick = 0
    var isGoingLeft = false
    
    //OUTLETS
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var finishedButton: UIButton!
    @IBOutlet weak var cardContainerview: UIView!
    
    //ACTIONS
    @IBAction func rightButtonPressed(_ sender: Any) {
        if(indexToPick<48){
            //Clear buttons so they dont overlap when the function is called again
            for view in cardContainerview.subviews{
                UIView.animate(withDuration: 0.7) {
                    view.center.x = CGFloat(-1.0*self.cardWidth)
                }
            }
            isGoingLeft = false
            initLevel()
        }
    }
    @IBAction func leftButtonPressed(_ sender: Any) {
        if(indexToPick>3){
            for view in cardContainerview.subviews{
                UIView.animate(withDuration: 0.7) {
                    view.center.x = CGFloat(self.cardWidth+Double(self.view.bounds.width))
                }
            }
            
            isGoingLeft = true
            
            indexToPick -= 6
            initLevel()
        }
    }
    
    //FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideEverything()
        
        createArray()
       
        cardWidth = (Double(self.cardContainerview.bounds.width)/1.40)
        cardHeight = cardWidth*1.395973154362416
        
        
    }
    
    func hideEverything(){
        rightButton.center.x += 50
        leftButton.center.x -= 50
        finishedButton.center.y += 50
    }
    
    func createArray(){
        //Loop that creates an in order non repeating array of numbers 0-51
        var inOrderArray = [Int]()
        for num in 0...51{
            inOrderArray.append(num)
        }
        
        //Loop that randomly pulls from array thats in order, puts them in a new array then removes num from first array
        cardOrder = [Int]()
        for _ in 0...51{
            let rand = Int(arc4random_uniform(UInt32(inOrderArray.count)))
            cardOrder.append(inOrderArray[rand])
            inOrderArray.remove(at: rand)
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
    
    override func initLevel() {
        
        var xPos = 0.0
        
        for _ in 0...2{
            let card: UIButton!
            if(isGoingLeft == false){
                card = UIButton(frame: CGRect(x: Double(self.view.bounds.width), y: Double(self.view.center.y), width: cardWidth, height: cardHeight))
            }else{
                card = UIButton(frame: CGRect(x: -1.0*cardWidth, y: Double(self.view.center.y), width: cardWidth, height: cardHeight))
            }
            card.setImage(UIImage(named: "card(\(cardOrder[indexToPick]))"), for: .normal)
            card.center.y = self.cardContainerview.bounds.height/2
            self.cardContainerview.addSubview(card)
            
            UIView.animate(withDuration: 0.7) {
                card.center.x = CGFloat(xPos + self.cardWidth/2)
            }
            
            xPos += cardWidth*0.2
            indexToPick += 1
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
