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
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector("swipeDetected:"))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: Selector("swipeDetected:"))
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    func swipeDetected(sender:UISwipeGestureRecognizer) {
            let listView = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
            self.presentViewController(listView, animated: true, completion: nil)
    }
    
}