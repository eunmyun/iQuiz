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
        
        setColor()
        
        let index: Int = Int((quest["answer"] as? String)!)! - 1
        correctAns = (quest["answers"]![index] as? String)!
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("swipeDetected:"))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("swipeDetected:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    func swipeDetected(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            helperFunc()
        } else if (sender.direction == .Right) {
            let listView = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            self.presentViewController(listView, animated: true, completion: nil)
        }
    }
    
    func setColor() {
        answer1.backgroundColor = UIColor(red: 0, green: 0.898, blue: 0.898, alpha: 1.0)
        answer2.backgroundColor = UIColor(red: 0, green: 0.898, blue: 0.898, alpha: 1.0)
        answer3.backgroundColor = UIColor(red: 0, green: 0.898, blue: 0.898, alpha: 1.0)
        answer4.backgroundColor = UIColor(red: 0, green: 0.898, blue: 0.898, alpha: 1.0)
    }
    
    @IBAction func answerPress(sender: UIButton) {
        answerSelect = sender.currentTitle!
        if sender.backgroundColor == UIColor(red: 0, green: 0.898, blue: 0.898, alpha: 1.0) {
            setColor()
            sender.backgroundColor = UIColor(red: 0.8471, green: 0.9569, blue: 0, alpha: 1.0)
        }
        else if sender.backgroundColor == UIColor(red: 0.8471, green: 0.9569, blue: 0, alpha: 1.0) {
            sender.backgroundColor = UIColor(red: 0, green: 0.898, blue: 0.898, alpha: 1.0)
        }
    }
    
    @IBAction func submit(sender: AnyObject) {
        helperFunc()
    }
    
    func helperFunc() {
        let aVC = self.storyboard?.instantiateViewControllerWithIdentifier("AnswerVC") as! AnswerVC
        aVC.questionArray = self.questionArray
        aVC.currQuestion = self.currQuestion
        
        aVC.correctAns = self.correctAns
        aVC.answerSelect = self.answerSelect
        
        aVC.totalQuestion = self.totalQuestion
        aVC.totalScore = self.totalScore
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