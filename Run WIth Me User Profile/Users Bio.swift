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
    
    
    init(name:String, hometown:String, mainGroup:String, height:Double, age:Int, gender:String, averagePace:Double) {
        self.name = name
        self.hometown = hometown
        self.mainGroup = mainGroup
        self.height = height
        self.age = age
        self.gender = gender
        self.averagePace = averagePace
    }
}