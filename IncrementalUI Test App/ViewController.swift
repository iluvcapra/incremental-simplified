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
    
    @IBOutlet weak var ageField: NSTextField!
    
    let person = Var<Person>(Person())
    
    var personAge : I<DateInterval>? = nil
    var personAgeObseverCtx : Disposable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindI(incremental: person.i.map(\Person.name), to: nameField)
        bindI(incremental: person.i.map(\Person.winCount), to: winCountField)
        bindI(incremental: person.i.map(\Person.birthdate), to: birthdateField)
        
        personAge = person.i.map { DateInterval(start: $0.birthdate, end:Date() )  }
        
        personAgeObseverCtx = personAge?.observe({ (d : DateInterval) in
            self.ageField.objectValue = DateComponents(calendar: NSCalendar.autoupdatingCurrent,
                                                       timeZone: TimeZone.autoupdatingCurrent,
                                                       era: 0, year: nil, month: nil, day: nil, hour: nil, minute: nil, second: Int(d.duration), nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
        })
        
    }

//    override var representedObject: Any? {
//        didSet {
//        // Update the view, if already loaded.
//        }
//    }


}

