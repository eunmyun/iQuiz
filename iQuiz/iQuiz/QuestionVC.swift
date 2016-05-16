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
    var currQuestion:Int = 0
    var correctAns = ""
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let quest: [String:AnyObject] = questionArray[currQuestion]
        question.text = quest["text"] as? String
        answer1.setTitle(quest["answers"]![0] as? String, forState: UIControlState.Normal)
        answer2.setTitle(quest["answers"]![1] as? String, forState: UIControlState.Normal)
        answer3.setTitle(quest["answers"]![2] as? String, forState: UIControlState.Normal)
        answer4.setTitle(quest["answers"]![3] as? String, forState: UIControlState.Normal)
        correctAns = (quest["answer"] as? String)!
    }
    
    
    
}