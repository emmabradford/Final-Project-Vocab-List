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
    @IBOutlet weak var editButton: UIBarButtonItem!
    //var word = vocabTextField.text
    //hope this works
    
    var vocabWords : [String] = ["lalalalalala"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
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
        if sender.tag == 0 {
            vocabTableView.editing = true
            sender.tag = 1
        } else {
            vocabTableView.editing = false
            sender.tag = 0
        }
    }
   
    @IBAction func plusOnTappedButton(sender: UIBarButtonItem) {
        var alert = UIAlertController(title: "add Vocabulary Word", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "add word here"
        }
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        var addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) { (action) -> Void in
            var vocabTextField = alert.textFields?[0] as! UITextField
            self.vocabWords.append(vocabTextField.text)
            self.vocabTableView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            vocabWords.removeAtIndex(indexPath.row)
            vocabTableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        var vocabList = vocabWords[sourceIndexPath.row]
        vocabWords.removeAtIndex(sourceIndexPath.row)
        vocabWords.insert(vocabList, atIndex: destinationIndexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vdvc = segue.destinationViewController as! VocabDetailViewController
        var index = vocabTableView.indexPathsForSelectedRows()
        //vdvc.vocabWordLabel = vocabTextField.text
        
    }
}
