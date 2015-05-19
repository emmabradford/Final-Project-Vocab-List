//
//  VocabDetailViewController.swift
//  Final Progect Vocab List
//
//  Created by Emma Bradford on 5/12/15.
//  Copyright (c) 2015 Emma Bradford. All rights reserved.
//

import UIKit

class VocabDetailViewController: UIViewController {

    @IBOutlet weak var vocabWordLabel: UILabel!
    @IBOutlet weak var vocabWordDeffinitionTextField: UITextField!
    @IBOutlet weak var vocabWordNotesTextField: UITextField!
    @IBOutlet weak var vocabImageView: UIImageView!
    let imagePicker = UIImagePickerController()
    var image = UIImage(named: "default")
    
    override func viewDidLoad() {
        vocabImageView.image = image
        super.viewDidLoad()
    }
    @IBAction func onWedsiteTappedButton(sender: UIButton) {
    }
    @IBAction func onSavedButtonTapped(sender: UIButton) {
    }
    @IBAction func onLibraryButtonTapped(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: {
            var selectedImage = info [UIImagePickerControllerOriginalImage] as! UIImage
            self.vocabImageView.image = selectedImage
        })
    }
}
