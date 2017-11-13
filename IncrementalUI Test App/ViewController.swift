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
    
    let person = Var<Person>(Person())
    
    var personAge : I<DateInterval>? = nil
    var personAgeObseverCtx : Disposable?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        })
        
    }

//    override var representedObject: Any? {
//        didSet {
//        // Update the view, if already loaded.
//        }
//    }


}

