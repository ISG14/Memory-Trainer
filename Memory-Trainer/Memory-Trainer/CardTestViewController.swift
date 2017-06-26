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
    var cardWidth = 0.0
    var cardHeight = 0.0
    var cardOrder: [Int]!
    var indexToPick = 0
    
    //OUTLETS
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var finishedButton: UIButton!
    @IBOutlet weak var cardContainerview: UIView!
    
    //ACTIONS
    @IBAction func rightButtonPressed(_ sender: Any) {
        if(indexToPick<48){
            initLevel()
        }
    }
    @IBAction func leftButtonPressed(_ sender: Any) {
        if(indexToPick>3){
            indexToPick -= 6
            initLevel()
        }
    }
    
    
    //FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()

        hideEverything()
        
        createArray()
        
        //cardWidth = Double(self.view.bounds.width
        cardWidth = (Double(self.cardContainerview.bounds.width)/1.40)
        cardHeight = cardWidth*1.395973154362416
        
        
    }
    
    func createArray(){
        //TODO: Loop that creates an in order non repeating array of numbers 0-51 
        var inOrderArray = [Int]()
        for num in 0...51{
            inOrderArray.append(num)
        }
        
        //TODO: Loop that randomly pulls from array thats in order, puts them in a new array then removes num from first array
        cardOrder = [Int]()
        for _ in 0...51{
            let rand = Int(arc4random_uniform(UInt32(inOrderArray.count)))
            cardOrder.append(inOrderArray[rand])
            inOrderArray.remove(at: rand)
        }
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
    
    override func initLevel() {
        
        //Clear buttons so they dont overlap when the function is called again
        for view in cardContainerview.subviews{
            view.removeFromSuperview()
        }
        
        var xPos = 0.0
        
        for _ in 0...2{
            let card: UIButton!
            card = UIButton(frame: CGRect(x: self.view., y: Double(self.view.center.y), width: cardWidth, height: cardHeight))
            card.setImage(UIImage(named: "card(\(cardOrder[indexToPick]))"), for: .normal)
            card.center.y = self.cardContainerview.bounds.height/2
            self.cardContainerview.addSubview(card)
            
            xPos += cardWidth*0.2
            indexToPick += 1
        }
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
