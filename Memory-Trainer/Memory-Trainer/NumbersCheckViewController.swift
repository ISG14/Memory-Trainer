//
//  NumbersCheckViewController.swift
//  Memory-Trainer
//
//  Created by Rio Lynk on 6/15/17.
//  Copyright © 2017 Lampshade Software. All rights reserved.
//

import UIKit

class NumbersCheckViewController: UIViewController {
    
    //VARIABLES
    var userGuesses: [String]!
    var digitArray: [String]!
    var numCorrect = 0
    var numIncorrect = 0
    
    //OUTLETS
    @IBOutlet weak var numbersCheckScrollView: UIScrollView!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var incorrectLabel: UILabel!
    
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
        incorrectLabel.text = "INCORRECT\n\(numIncorrect)"
        
        //Variables
        var yHeight = 100
        
        for index in 0..<userGuesses.count{
            
            //Make label for real number
            var realLabel: UILabel!
            realLabel = UILabel(frame: CGRect(origin: self.view.center, size: CGSize(width: 50, height: 50)))
            realLabel.center.x = self.numbersCheckScrollView.bounds.width / 2 - 25
            realLabel.center.y = CGFloat(yHeight)
            realLabel.textAlignment = .center
            realLabel.text = digitArray[index]
            self.numbersCheckScrollView.addSubview(realLabel)
            
            //Make label for user guess
            var guessLabel: UILabel!
            guessLabel = UILabel(frame: CGRect(origin: self.view.center, size: CGSize(width: 50, height: 50)))
            guessLabel.center.x = self.numbersCheckScrollView.bounds.width / 2 + 25
            guessLabel.center.y = CGFloat(yHeight)
            guessLabel.textAlignment = .center
            guessLabel.text = userGuesses[index]
            self.numbersCheckScrollView.addSubview(guessLabel)
            
            //Set color of guesses to show if right or wrong
            if(userGuesses[index] != digitArray[index]){
                guessLabel.textColor = .red
            }else{
                guessLabel.textColor = .green
            }
            
            yHeight += 50
        }
 
        numbersCheckScrollView.contentSize.height = CGFloat(yHeight - 25)

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
