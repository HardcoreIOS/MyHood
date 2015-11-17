//
//  AddPostViewController.swift
//  MyHood
//
//  Created by Abdurrahman on 11/14/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Round Outlets
    @IBOutlet weak var roundCancel: UIButton!
    @IBOutlet weak var roundUploadPost: UIButton!
    @IBOutlet weak var roundTextField1: UITextField!
    @IBOutlet weak var roundTextField2: UITextField!
    // END
    
    // Image info
    @IBOutlet weak var postImage: UIImageView!
    var imagePicker: UIImagePickerController!
    
    
    // Text Fields
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Round buttons and textfields and image
        self.roundCancel.layer.cornerRadius = 15.0
        self.roundUploadPost.layer.cornerRadius = 15.0
        self.roundTextField1.layer.cornerRadius = 15.0
        self.roundTextField2.layer.cornerRadius = 15.0
        self.postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        // End Of rounded buttons and textfields and image
        
        //Image initialized
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        // Handling the keyboard
        self.view.endEditing(true)
        
    }
    
    @IBAction func uploadNewPostButtonPressed(sender: UIButton) {
        if let title = titleTextField.text, let desc  = descriptionTextField.text, let image = postImage.image {
            
            let imagePath = DataService.instance.saveImageAndCreatePath(image)
            
            let post = Post(imagePath: imagePath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPictureButtonPressed(sender: AnyObject) {
        sender.setTitle("", forState: .Normal)
        
        presentViewController(imagePicker, animated: true, completion: nil)
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImage.image = image
    }
    
    
    
    
    
    // Light status bar
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    

}
