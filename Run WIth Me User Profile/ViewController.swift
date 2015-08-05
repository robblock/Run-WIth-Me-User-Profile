//
//  ViewController.swift
//  Run WIth Me User Profile
//
//  Created by Rob Block on 8/4/15.
//  Copyright (c) 2015 Robert. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //usersPicture
        userPicture.userInteractionEnabled = true
        recognizer.addTarget(self, action: "userPictureHasBeenTapped")
        userPicture.addGestureRecognizer(recognizer)
        imagePicker.delegate = self
        
        //experienceBar - Starting at 0
        experienceBar.setProgress(0, animated: true)
    }
    
    //MARK: -ImagePicker
    let recognizer = UITapGestureRecognizer()
    let imagePicker = UIImagePickerController()
    
    func userPictureHasBeenTapped() { //1
        println("image tapped")
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) { //2
        userPicture.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        userPicture.contentMode = UIViewContentMode.ScaleAspectFill
        userPicture.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil) //3
    }
    
    //MARK: -ExperienceBar
    var progress:Int = 0 {
        didSet {
            let fractionalProgress = Float(progress) / 100.0
            let animated = progress != 0
            
            experienceBar.setProgress(fractionalProgress, animated: animated)
        }
    }
    
    func updateExperienceBar() {
        //Work on this after we have backend setup
    }
    
    
    //MARK: -TableView Datasource & Delegates
    
    
    //MARK: -Outlets
    @IBOutlet weak var experienceBar: UIProgressView!
    @IBOutlet weak var userPicture: UIImageView!
    @IBOutlet weak var tableViewOne: UITableView!
    @IBOutlet weak var tableViewTwo: UITableView!
    
    
    //Actions
    @IBAction func callButton(sender: AnyObject) {
        //TODO: setup backend
    }
    @IBAction func messageButton(sender: AnyObject) {
        //TODO: setup backend
    }
    
    
    
}

