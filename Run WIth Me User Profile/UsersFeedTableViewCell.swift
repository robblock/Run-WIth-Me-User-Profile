//
//  UsersFeedTableViewCell.swift
//  Run WIth Me User Profile
//
//  Created by Rob Block on 8/10/15.
//  Copyright (c) 2015 Robert. All rights reserved.
//

import UIKit
import MapKit
import SwiftMoment

class UsersFeedTableViewCell: UITableViewCell {

    //MARK: - Time
    
    let timeOfRun = moment([], timeZone: NSTimeZone.localTimeZone(), locale: NSLocale.currentLocale())
    let now = moment(timeZone: NSTimeZone.localTimeZone(), locale: NSLocale.currentLocale())

    func configureDateAndTimeLabel() {
        timeSinceLabel.text = "\(timeOfRun! - now)"
        println("\(timeOfRun! - now)")
    }
    
    //MARK: - Distance
    
    //MARK: - Map
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Actions & Outlets
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var mapOfLastRun: MKMapView!
    @IBOutlet weak var timeSinceLabel: UILabel!
    @IBOutlet weak var dateOfRunLabel: UILabel!
    
    @IBAction func shareButton(sender: AnyObject) {
        //TODO: Set up share actionsheet
    }
}
