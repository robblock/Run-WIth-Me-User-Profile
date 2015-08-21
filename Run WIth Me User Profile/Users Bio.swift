//
//  Users Bio.swift
//  Run WIth Me User Profile
//
//  Created by Rob Block on 8/6/15.
//  Copyright (c) 2015 Robert. All rights reserved.
//

import Foundation

class UsersBio {
    var name:String = ""
    var hometown: String = ""
    var mainGroup:String = ""
    var height:Double?
    var age:Int?
    var gender:String = ""
    var averagePace:Double?
    var totalNumberOfRuns:Int?
    var totalDistance:Double?
    var numberOfGroups:Int?
    var numberOfFriends:Int?
    var timeSinceLastRun:NSDate
    var totalNumberOfGroups:Int?
    
    
    
    init(name:String, hometown:String, mainGroup:String, height:Double, age:Int, gender:String, averagePace:Double, totalNumberOfRuns:Int, totalDistance:Double, numberOfGroups:Int, numberOfFriends:Int, timeSinceLastRun:NSDate, totalNumberOfGroups:Int) {
        self.name = name
        self.hometown = hometown
        self.mainGroup = mainGroup
        self.height = height
        self.age = age
        self.gender = gender
        self.averagePace = averagePace
        self.totalNumberOfRuns = totalNumberOfRuns
        self.totalDistance = totalDistance
        self.numberOfFriends = numberOfFriends
        self.numberOfGroups = numberOfGroups
        self.numberOfFriends = numberOfFriends
        self.timeSinceLastRun = timeSinceLastRun
        self.totalNumberOfGroups = totalNumberOfGroups
    }
    
}

class TotalCaloriesBurned {
    var weight:Double?
    var height:Double?
    var age:Int?
    var distance:Double?
    
    init(weight:Double, height:Double, age:Int, distance:Double) {
        self.weight = weight
        self.height = height
        self.age = age
        self.distance = distance
        
    }
}