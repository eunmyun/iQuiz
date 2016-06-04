//
//  ViewController.swift
//  iQuiz
//
//  Created by MyungJin Eun on 5/4/16.
//  Copyright © 2016 MyungJin Eun. All rights reserved.
//

import UIKit

struct JSONlink {
    static var site = "http://tednewardsandbox.site44.com/questions.json"
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!

    @IBAction func settings(sender: AnyObject) {
        /*let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)*/
        
        let alertController : UIAlertController = UIAlertController(title: "Alert!", message: "Settings go here.", preferredStyle: .Alert)
        let okAction : UIAlertAction = UIAlertAction(title: "Okay", style: .Default, handler: nil )
        
        alertController.addAction(okAction)
        
        alertController.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in
            textField.placeholder = "New JSON link"
        }
        
        let retrieveAction : UIAlertAction = UIAlertAction(title: "Check Now", style: .Cancel, handler: {[weak self]
            (paramAction:UIAlertAction!) in
            if let textFields = alertController.textFields {
                let theTextFields = textFields as [UITextField]
                let enteredText = theTextFields[0].text
                if enteredText != nil {
                    JSONlink.site = enteredText!
                } else {
                    JSONlink.site = "http://tednewardsandbox.site44.com/questions.json"
                }
                self!.tableView.reloadData()
            }
            })
        
        alertController.addAction(retrieveAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    var titles : [String] = []
    var descs : [String]  = []
    var images = [UIImage(named: "science"), UIImage(named: "heroes"), UIImage(named: "mathematics")]
    
    let json = JSONData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        self.json.fetchData {
            self.titles = self.json.titles
            self.descs = self.json.descs
            self.tableView.reloadData()
        }
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    func refresh(sender:AnyObject) {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titles.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
        
        cell.subject.text = titles[indexPath.row]
        cell.subtitle.text = descs[indexPath.row]
        cell.photo.image = images[indexPath.row]
                return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let qVC = self.storyboard?.instantiateViewControllerWithIdentifier("QuestionVC") as! QuestionVC
        qVC.questionArray = json.questions[indexPath.row]
        self.presentViewController(qVC, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
