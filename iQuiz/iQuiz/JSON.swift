//
//  JSON.swift
//  iQuiz
//
//  Created by MyungJin Eun on 5/13/16.
//  Copyright © 2016 MyungJin Eun. All rights reserved.
//

import Foundation

class JSONData {
    
    var titles : [String] = []
    var descs: [String] = []
    var questions:[[[String:AnyObject]]] = []
    
    func checkLocalStorage() {
        //Check if json exists
        
        //let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let tempDirURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).URLByAppendingPathComponent(NSProcessInfo.processInfo().globallyUniqueString, isDirectory: true)
        let filePath = tempDirURL.URLByAppendingPathComponent("quiz.json").absoluteString
        let fileManager = NSFileManager.defaultManager()
        if fileManager.fileExistsAtPath(filePath) {
            print("FILE AVAILABLE")
        } else {
            print("FILE NOT AVAILABLE")
        }
        
    }
    
    func fetchData(completionHandler: () -> Void) {
        let requestURL: NSURL = NSURL(string: "http://tednewardsandbox.site44.com/questions.json")!
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(requestURL) {(data, response, error) -> Void in
            guard data != nil else {
                print(error)
                return
            }
            
            do {
                let responseArray =  try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSArray
                guard let response = responseArray as? [[String : AnyObject]] else {return}
                
                for quiz in response {
                    let title = quiz["title"] as? String
                    self.titles.append(title!)
                    
                    let desc = quiz["desc"] as? String
                    self.descs.append(desc!)
                    
                    var questionsPerQuiz:[[String:AnyObject]] = []
                    for question in quiz["questions"] as! NSArray {
                        questionsPerQuiz.append(question as! [String : AnyObject])
                    }
                    self.questions.append(questionsPerQuiz)
                }
                completionHandler()

            } catch {
                print(error)
            }
            
        }
        task.resume()
    }
}
