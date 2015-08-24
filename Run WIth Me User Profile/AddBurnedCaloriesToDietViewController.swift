//
//  AddBurnedCaloriesToDietViewController.swift
//  Run WIth Me User Profile
//
//  Created by Rob Block on 8/24/15.
//  Copyright (c) 2015 Robert. All rights reserved.
//

import Foundation
import UIKit

extension NSDate{
    func dateByAddingMinutes(minutes: Double) -> NSDate{
        return self.dateByAddingMinutes(minutes * 60.0)
    }
}

struct CaloriesBurned{
    var name: String
}