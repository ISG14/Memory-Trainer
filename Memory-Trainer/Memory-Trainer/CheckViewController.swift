//
//  CheckViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 7/2/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class CheckViewController: UIViewController {
    
    //VARIABLES
    var userGuesses: [String]!
    var digitArray: [String]!
    var numCorrect = 0
    var numIncorrect = 0
    
    var checkScrollView: UIScrollView!
    var correctLabel: UILabel!
    var incorrectLabel: UILabel!
    //OUTLETS
    
    
    //ACTIONS
    
    
    //FUNCTIONS
    func findNumCorrect(){
        for index in 0..<userGuesses.count{
            if (userGuesses[index] == digitArray[index]){
                numCorrect += 1
            }else{
                numIncorrect += 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findNumCorrect()
        
        //Num correct and incorrect labels
        correctLabel.textColor = .green
        correctLabel.text = "CORRECT:\n\(numCorrect)"
        incorrectLabel.textColor = .red
        incorrectLabel.text = "INCORRECT:\n\(numIncorrect)"
        
        //Variables
        var yHeight = 100
        
        for index in 0..<userGuesses.count{
            
            //Make label for real number
            var realLabel: UILabel!
            realLabel = UILabel(frame: CGRect(origin: self.view.center, size: CGSize(width: 50, height: 50)))
            realLabel.center.x = self.checkScrollView.bounds.width / 2 - 25
            realLabel.center.y = CGFloat(yHeight)
            realLabel.textAlignment = .center
            realLabel.text = digitArray[index]
            self.checkScrollView.addSubview(realLabel)
            
            //Make label for user guess
            var guessLabel: UILabel!
            guessLabel = UILabel(frame: CGRect(origin: self.view.center, size: CGSize(width: 50, height: 50)))
            guessLabel.center.x = self.checkScrollView.bounds.width / 2 + 25
            guessLabel.center.y = CGFloat(yHeight)
            guessLabel.textAlignment = .center
            guessLabel.text = userGuesses[index]
            self.checkScrollView.addSubview(guessLabel)
            
            //Set color of guesses to show if right or wrong
            if(userGuesses[index] != digitArray[index]){
                guessLabel.textColor = .red
            }else{
                guessLabel.textColor = .green
            }
            
            if(index%2 == 0){
                yHeight += 25
            }else{
                yHeight += 50
            }
            
        }
        
        checkScrollView.contentSize.height = CGFloat(yHeight)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
