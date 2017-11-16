//
//  Person.swift
//  IncrementalUI Test App
//
//  Created by Jamie Hardt on 11/12/17.
//  Copyright © 2017 objc.io. All rights reserved.
//

import Cocoa

struct Person: Equatable  {
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


struct Summation: Equatable {
    var eks : Int = 0
    var why : Int = 0
    
    var zed : Int {
        get {
            return eks + why
        }
        set(val) {
            why = val - eks
        }
    }
    
    static func ==(lhs : Summation, rhs: Summation) -> Bool {
        return lhs.eks == rhs.eks && lhs.why == rhs.why
    }
}
