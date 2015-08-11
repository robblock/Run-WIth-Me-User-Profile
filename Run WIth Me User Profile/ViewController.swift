//
//  ViewController.swift
//  Run WIth Me User Profile
//
//  Created by Rob Block on 8/4/15.
//  Copyright (c) 2015 Robert. All rights reserved.
//

import UIKit
import SwiftMoment


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {

    var usersBio: UsersBio!
    
    //creating empty array to store users information -- Comment out when we have userlogin and setup feature set up.
    var bio:[UsersBio] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting the screens title label as the users name
        title = self.usersBio.name
        
        //usersPicture
        userPicture.userInteractionEnabled = true
        recognizer.addTarget(self, action: "userPictureHasBeenTapped")
        userPicture.addGestureRecognizer(recognizer)
        imagePicker.delegate = self
        
        //experienceBar - Starting at 0
        experienceBar.setProgress(0, animated: true)
        
        //Configuring tableViewCells
        tableViewOne.estimatedRowHeight = 36.0
        tableViewOne.rowHeight = UITableViewAutomaticDimension
        
        self.tableViewOne.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        self.tableViewOne.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        self.tableViewOne.tableFooterView = UIView(frame: CGRectZero)

    }

    
    //MARK: - ImagePicker
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
    
    //MARK: - ExperienceBar
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
    
    
    //MARK: - TableView Datasource & Delegates
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! UserDetailTableViewCell
        
        
        //configure the cell
        cell.backgroundColor = UIColor.clearColor()
        
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Age"
            cell.valueLabel.text = "\(usersBio.age)"
        case 1:
            cell.fieldLabel.text = "Height"
            cell.valueLabel.text = "\(usersBio.height)"
        case 2:
            cell.fieldLabel.text = "Gender"
            cell.valueLabel.text = usersBio.gender
        case 3:
            cell.fieldLabel.text = "Average Pace"
            cell.valueLabel.text = "\(usersBio.averagePace)"
        case 4:
            cell.fieldLabel.text = "More Details"
            cell.valueLabel.text = ""
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        return cell
    }
    
    //If last cell is tapped segue to MoreDetailViewController
    func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "MoreDetail" {
                if let indexPath = self.tableViewOne.indexPathForSelectedRow() {
                    let destinationController = segue.destinationViewController as! MoreDetailViewController
                    destinationController.userName = usersBio.name
                }
            }
        }
        
    }
    
    //MARK: - Date Since Last..
    var timeSinceLastRun = Tempo { (newTemp) -> () in
        newTemp.years = 2014
        newTemp.months = 12
        newTemp.days = 12
    }
    
    

    //MARK: - Actions & Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!

    @IBOutlet weak var experienceBar: UIProgressView!
    @IBOutlet weak var userPicture: UIImageView!
    
    @IBOutlet weak var tableViewOne: UITableView!
    
    @IBAction func callButton(sender: AnyObject) {
        //TODO: setup backend
    }
    @IBAction func messageButton(sender: AnyObject) {
        //TODO: setup backend
    }
    
    
    
}

