//
//  QuestionVC.swift
//  iQuiz
//
//  Created by MyungJin Eun on 5/14/16.
//  Copyright © 2016 MyungJin Eun. All rights reserved.
//

import UIKit

class QuestionVC: UIViewController {
    var questionArray: [[String : AnyObject]] = []
    var currQuestion:Int = -1
    
    var correctAns = ""
    var answerSelect = ""
    
    var totalQuestion = 0
    var totalScore = 0
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currQuestion += 1
        let quest: [String:AnyObject] = questionArray[currQuestion]
        question.text = quest["text"] as? String
        answer1.setTitle(quest["answers"]![0] as? String, forState: UIControlState.Normal)
        answer2.setTitle(quest["answers"]![1] as? String, forState: UIControlState.Normal)
        answer3.setTitle(quest["answers"]![2] as? String, forState: UIControlState.Normal)
        answer4.setTitle(quest["answers"]![3] as? String, forState: UIControlState.Normal)
        let index: Int = Int((quest["answer"] as? String)!)! - 1
        correctAns = (quest["answers"]![index] as? String)!
    }
    
    @IBAction func answerPress(sender: UIButton) {
        answerSelect = sender.currentTitle!
    }
    
    @IBAction func submit(sender: AnyObject) {
        let aVC = self.storyboard?.instantiateViewControllerWithIdentifier("AnswerVC") as! AnswerVC
        aVC.questionArray = self.questionArray
        aVC.currQuestion = self.currQuestion
        aVC.correctAns = self.correctAns
        aVC.answerSelect = self.answerSelect
        self.presentViewController(aVC, animated: true, completion: nil)
    }
    
}

/*
 func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
 let qVC = self.storyboard?.instantiateViewControllerWithIdentifier("QuestionVC") as! QuestionVC
 qVC.questionArray = json.questions[indexPath.row]
 self.presentViewController(qVC, animated: true, completion: nil)
 }
*/