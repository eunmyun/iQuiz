//
//  AnswerVC.swift
//  iQuiz
//
//  Created by MyungJin Eun on 5/14/16.
//  Copyright © 2016 MyungJin Eun. All rights reserved.
//

import UIKit

class AnswerVC: UIViewController {
    var questionArray: [[String : AnyObject]] = []
    var currQuestion:Int = -1
    
    var correctAns: String = ""
    var answerSelect: String = ""
    
    var totalQuestion = 0
    var totalScore = 0
    
    @IBOutlet weak var answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var message = ""
        totalQuestion += 1
        if (correctAns == answerSelect) {
            totalScore += 1
            message += "Correct!\n"
        } else {
            message += "Wrong!\n"
        }
        message += "The answer is \(correctAns)"
        answer.text = message
    }
    
    @IBAction func next(sender: AnyObject) {
        if currQuestion + 1 <= questionArray.count - 1 {
            let qVC = self.storyboard?.instantiateViewControllerWithIdentifier("QuestionVC") as! QuestionVC
            qVC.questionArray = self.questionArray
            qVC.currQuestion = self.currQuestion
            
            qVC.totalQuestion = self.totalQuestion
            qVC.totalScore = self.totalScore
            self.presentViewController(qVC, animated: true, completion: nil)
        } else {
            let rVC = self.storyboard?.instantiateViewControllerWithIdentifier("ResultVC") as! ResultVC
            rVC.totalQuestion = self.totalQuestion
            rVC.totalScore = self.totalScore
            self.presentViewController(rVC, animated: true, completion: nil)
        }
    }
    
    
}