//
//  UsersFeedTableViewCell.swift
//  Run WIth Me User Profile
//
//  Created by Rob Block on 8/10/15.
//  Copyright (c) 2015 Robert. All rights reserved.
//

import UIKit
import MapKit

class UsersFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var mapOfLastRun: MKMapView!
    var date = Tempo { (newTemp) -> () in
        newTemp.years = 2014
        newTemp.months = 10
        newTemp.days = 25
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: -Actions & Outlets
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
 
}
