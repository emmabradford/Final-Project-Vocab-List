//
//  UnitListViewController.swift
//  Final Progect Vocab List
//
//  Created by ajakopin on 5/1/15.
//  Copyright (c) 2015 Emma Bradford. All rights reserved.
//

import UIKit

class UnitListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var unitListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = "hiehfsi"
        return cell
    }
    
    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
    }
    
    @IBAction func onTappedEditButton(sender: UIBarButtonItem) {
    }
    

}
