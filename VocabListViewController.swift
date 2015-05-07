//
//  VocabListViewController.swift
//  Final Progect Vocab List
//
//  Created by Emma Bradford on 5/5/15.
//  Copyright (c) 2015 Emma Bradford. All rights reserved.
//

import UIKit

class VocabListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var vocabTableView: UITableView!
    //hope this works
    
    var vocabWords : [String] = ["lalalalalala"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vocabWords.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = vocabTableView.dequeueReusableCellWithIdentifier("myCell2", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = vocabWords[indexPath.row]
        return cell
    }
    
    @IBAction func editOnTappedButton(sender: UIBarButtonItem) {
    }
   
    @IBAction func plusOnTappedButton(sender: UIBarButtonItem) {
    }

}
