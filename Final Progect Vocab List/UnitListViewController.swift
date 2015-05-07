//
//  UnitListViewController.swift
//  Final Progect Vocab List
//
//  Created by ajakopin on 5/1/15.
//  Copyright (c) 2015 Emma Bradford. All rights reserved.
//

import UIKit

class UnitListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var unitListTableView: UITableView!
    
    var units = ["Unit 1", "Unit 2", "Unit 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButtonItem().tag = 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return units.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = units[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            units.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }

    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
        var alert = UIAlertController(title: "Add Unit", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add Unit Here"
        }
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        var addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) { (action) -> Void in
            var unitTextField = alert.textFields?[0] as! UITextField
            self.units.append(unitTextField.text)
            self.unitListTableView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func onTappedEditButton(sender: UIBarButtonItem) {
        if sender.tag == 0 {
            unitListTableView.editing = true
            sender.tag = 1
        }
        else {
            unitListTableView.editing = false
            sender.tag = 0
        }
    }
    

}
