//
//  ViewController.swift
//  IncrementalUI Test App
//
//  Created by Jamie Hardt on 11/12/17.
//  Copyright © 2017 objc.io. All rights reserved.
//

import Cocoa
import Incremental

class ViewController: IViewController {
    
    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet weak var winCountField: NSTextField!
    @IBOutlet weak var birthdateField: NSTextField!
    
    let person = Var<Person>(Person())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindI(incremental: person.i.map(\Person.name), to: nameField)
        bindI(incremental: person.i.map(\Person.winCount), to: winCountField)
        bindI(date: person.i.map(\Person.birthdate), to: birthdateField)
        
    }

//    override var representedObject: Any? {
//        didSet {
//        // Update the view, if already loaded.
//        }
//    }


}

