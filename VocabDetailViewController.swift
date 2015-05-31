//
//  VocabDetailViewController.swift
//  Final Progect Vocab List
//
//  Created by Emma Bradford on 5/12/15.
//  Copyright (c) 2015 Emma Bradford. All rights reserved.
//

import UIKit

class VocabDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var vocabWordTextField: UITextField!
    @IBOutlet weak var vocabWordDeffinitionTextField: UITextField!
    @IBOutlet weak var vocabWordNotesTextField: UITextField!
    @IBOutlet weak var vocabImageView: UIImageView!
    let imagePicker = UIImagePickerController()
    var image = UIImage(named: "default")
    var word = ""
    var wordDefinition = ""
    var notes = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vocabImageView.image = image
        vocabWordDeffinitionTextField.text = wordDefinition
        vocabWordNotesTextField.text = notes
        imagePicker.delegate = self
    }
    @IBAction func onWedsiteTappedButton(sender: UIButton) {
    }
    @IBAction func onSavedButtonTapped(sender: UIButton) {
        image = vocabImageView.image
        wordDefinition = vocabWordDeffinitionTextField.text
        notes = vocabWordNotesTextField.text
    }
    @IBAction func onLibraryButtonTapped(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: {
            var selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.vocabImageView.image = selectedImage
        })
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nvc = segue.destinationViewController as! UINavigationController
        var wvc = nvc.topViewController as! WebViewController
        wvc.website = "http://dictionary.reference.com/browse/" + vocabWordTextField.text
    }
    @IBAction func onDoneButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
