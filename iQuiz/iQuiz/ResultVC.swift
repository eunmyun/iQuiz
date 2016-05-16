//
//  ResultVC.swift
//  iQuiz
//
//  Created by MyungJin Eun on 5/14/16.
//  Copyright © 2016 MyungJin Eun. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    var totalQuestion = 0
    var totalScore = 0
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let message = "You got \(totalScore) right out of \(totalQuestion) question(s)!"
        result.text = message
    }
}