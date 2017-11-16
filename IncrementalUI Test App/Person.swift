//
//  Person.swift
//  IncrementalUI Test App
//
//  Created by Jamie Hardt on 11/12/17.
//  Copyright © 2017 objc.io. All rights reserved.
//

import Cocoa

class Person : NSObject {
    var name = "New Person"
    var winCount = 5
    var birthdate = Date(timeIntervalSince1970: 0)
    
    var age : TimeInterval {
        get {
            return DateInterval(start: birthdate, end: Date()).duration
        }
        
        set(val) {
            birthdate = Date(timeInterval: -val, since: Date() )
        }
    }
    
    static func ==(lhs : Person, rhs : Person) -> Bool {
        return lhs.name == rhs.name &&
            lhs.winCount == rhs.winCount &&
            lhs.birthdate == rhs.birthdate
    }
}
