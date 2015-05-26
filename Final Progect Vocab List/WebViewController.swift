//
//  WebViewController.swift
//  Final Progect Vocab List
//
//  Created by ajakopin on 5/13/15.
//  Copyright (c) 2015 Emma Bradford. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var website = ""
    @IBOutlet weak var vocabDeffinitionWedView: UIWebView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let googleURL = NSURL(string: "\(website)")
        let myRequest = NSURLRequest(URL: googleURL!)
        vocabDeffinitionWedView.loadRequest(myRequest)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func doneOnTappedButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    

}
