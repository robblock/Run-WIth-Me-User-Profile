//
//  ViewController.swift
//  Run WIth Me User Profile
//
//  Created by Rob Block on 8/4/15.
//  Copyright (c) 2015 Robert. All rights reserved.
//

import UIKit
import SwiftMoment
import HealthKit

enum HeightUnits: String{
    case Millimeters = "Millimeters"
    case Centimeters = "Centimeters"
    case Meters = "Meters"
    case Inches = "Inches"
    case Feet = "Feet"
    static let allValues = [Millimeters, Centimeters, Meters, Inches, Feet]
    
    func healthKitUnit() -> HKUnit{
        switch self{
        case .Millimeters:
            return HKUnit.meterUnitWithMetricPrefix(.Milli)
        case .Centimeters:
            return HKUnit.meterUnitWithMetricPrefix(.Centi)
        case .Meters:
            return HKUnit.meterUnit()
        case .Inches:
            return HKUnit.inchUnit()
        case .Feet:
            return HKUnit.footUnit()
        }
    }
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate {

    var usersBio: UsersBio!
    var totalCaloriesBurned: TotalCaloriesBurned!

    
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
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
        
        tableViewOne.estimatedRowHeight = 36.0
        tableViewOne.rowHeight = UITableViewAutomaticDimension
        
        self.tableViewOne.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        self.tableViewOne.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        self.tableViewOne.tableFooterView = UIView(frame: CGRectZero)
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }

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
    func updateProgress() {
        experienceBar.progress += 0.05
        let progressValue = self.experienceBar?.progress
        progressLabel.text = "\(progressValue! * 100)"
    }
    
    //TODO: Link to backend
    
    
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
            cell.fieldLabel.text = "Total Distance"
            cell.valueLabel.text = "\(usersBio.totalDistance)"
        case 1:
            cell.fieldLabel.text = "Number of Groups"
            cell.valueLabel.text = "\(usersBio.numberOfGroups)"
        case 2:
            cell.fieldLabel.text = "Total Time Running"
            cell.valueLabel.text = usersBio.gender
        case 3:
            cell.fieldLabel.text = "Average Pace"
            cell.valueLabel.text = "\(usersBio.averagePace)"
            case 4:
            cell.fieldLabel.text = "Total Number of Runs"
            cell.valueLabel.text = "\(usersBio.totalNumberOfRuns)"
        case 5:
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
    
    //Mark: - Picker
    

    //MARK: - Date Since Last..
    let timeOfRun = moment([], timeZone: NSTimeZone.localTimeZone(), locale: NSLocale.currentLocale())
    let now = moment(timeZone: NSTimeZone.localTimeZone(), locale: NSLocale.currentLocale())
    
//    func configureDateAndTimeLabel() {
//        timeSinceLabel.text = "\(timeOfRun! - now)"
//        println("\(timeOfRun! - now)")
//    }
    
    //MARK: - Health Data
    let heightQuantity = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeight)
    let weightQuantity = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierBodyMass)
    let heartRateQuantityt = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierHeartRate)
    
    lazy var healthStore = HKHealthStore()
    
    lazy var typesToShare: NSSet = {
        return NSSet(object: self.heightQuantity, self.weightQuantity)
        }()
    
    lazy var typesToRead: NSSet = {
        return  NSSet(object: self.heightQuantity, self.weightQUantity, self.heartRateQuantity)
        }()
    

    //Asking permission from the health store
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if HKHealthStore.isHealthDataAvailable(){
            
            healthStore.requestAuthorizationToShareTypes(typesToShare,
                readTypes: typesToRead,
                completion: {succeeded, error in
                    
                    if succeeded && error == nil{
                        print("Successfully received authorization")
                    } else {
                        if let theError = error{
                            print("Error occurred = \(theError)")
                        }
                    }
                    
            })
            
        } else {
            print("Health data is not available")
        }
    //MARK: - Actions & Outlets

    @IBAction func ageButton(sender: AnyObject) {
        let actionMenu = UIAlertController(title: "Age", message: nil, preferredStyle: .ActionSheet)
    }

    @IBAction func heightButton(sender: AnyObject) {
        let actionMenu = UIAlertController(title: "height", message: nil, preferredStyle: .ActionSheet)
    }
    
    @IBAction func weightButton(sender: AnyObject) {
    }
    
    @IBAction func genderButton(sender: AnyObject) {
    }
    
    @IBOutlet weak var experienceBar: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var userPicture: UIImageView!
    
    @IBOutlet weak var tableViewOne: UITableView!
    
    @IBAction func callButton(sender: AnyObject) {
        //TODO: setup backend
    }
    @IBAction func messageButton(sender: AnyObject) {
        //TODO: setup backend
    }
    
    
    
}

