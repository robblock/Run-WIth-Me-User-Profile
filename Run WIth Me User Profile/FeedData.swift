//
//  FeedData.swift
//  Run WIth Me User Profile
//
//  Created by Rob Block on 8/10/15.
//  Copyright (c) 2015 Robert. All rights reserved.
//

import Foundation

class FeedData {
    var distance:String = ""
    var time:String = ""
    
    
    //TODO: - Figure out how to display time & Date
    init(distance:String, time:String) {
        self.distance = distance
        self.time = time
    }
}