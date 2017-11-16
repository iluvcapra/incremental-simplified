//
//  ViewController.swift
//  IncrementalUI Test App
//
//  Created by Jamie Hardt on 11/12/17.
//  Copyright © 2017 objc.io. All rights reserved.
//

import Cocoa
import Incremental

class ViewController: NSViewController {
    
    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet weak var winCountField: NSTextField!
    @IBOutlet weak var birthdateField: NSDatePicker!
    
    @IBOutlet weak var ageField: NSTextField!
    
    let personController = VarController<Person>(value: Person())
    
    @IBOutlet weak var xField: NSTextField!
    @IBOutlet weak var yField: NSTextField!
    @IBOutlet weak var zField: NSTextField!
    
    let sumController = VarController<Summation>(value: Summation())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personController.bind(keyPath: \Person.name, toObjectValueOf: nameField, withFallback: "No Name")
        personController.bind(keyPath: \Person.winCount, toObjectValueOf: winCountField, withFallback: 0)
        personController.bind(keyPath: \Person.birthdate, toObjectValueOf: birthdateField, withFallback: Date() )
        
        personController.bind(keyPath: \Person.age, toObjectValueOf: ageField, withFallback: TimeInterval(0.0))
        
        sumController.bind(keyPath: \Summation.eks, toObjectValueOf: xField, withFallback: 0)
        sumController.bind(keyPath: \Summation.why, toObjectValueOf: yField, withFallback: 0)
        sumController.bind(keyPath: \Summation.zed, toObjectValueOf: zField, withFallback: 0)
    }

//    override var representedObject: Any? {
//        didSet {
//        // Update the view, if already loaded.
//        }
//    }


}

