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
    @IBOutlet weak var birthdateField: NSTextField!
    
    @IBOutlet weak var ageField: NSTextField!
    
    let personController = VarController<Person>(value: Person())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personController.bind(keyPath: \Person.name, toObjectValueOf: nameField, withFallback: "No Name")
        personController.bind(keyPath: \Person.winCount, toObjectValueOf: winCountField, withFallback: 0)
        

    }

//    override var representedObject: Any? {
//        didSet {
//        // Update the view, if already loaded.
//        }
//    }


}

