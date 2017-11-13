//
//  IncrementalViewController.swift
//  IncrementalSimplified
//
//  Created by Jamie Hardt on 11/12/17.
//  Copyright © 2017 objc.io. All rights reserved.
//

import Foundation
import AppKit

open class IViewController : NSViewController {
    
    private class LinkResponder: NSObject {
        
        var action : (AnyObject?) -> () = {(sender) in return}
        
        init(action a : @escaping (AnyObject?) -> ()) {
            action = a
            super.init()
        }
        
        @IBAction func respond(_ sender : AnyObject?) {
            action(sender)
        }
        
        func dispose() {
            
        }
    }
    
    var disposables : [Disposable] = []
    
    public func bindI(incremental :I<String> , to control : NSControl) {
        let d = incremental.observe {
            control.stringValue = $0
        }
        
        disposables.append(d)
    }
    
    public func bindI(incremental :I<Int> , to control : NSControl) {
        let d = incremental.observe {
            control.integerValue = $0
        }
        
        disposables.append(d)
    }
    
    public func bindI(date date_i: I<Date>, to control : NSControl) {
        let d = date_i.observe {
            control.objectValue = $0
        }
        
        disposables.append(d)
    }
    
    public func bindI(valueOf control : NSControl, to v : Var<String>) {
        self.addResponder(control: control) { (sender) in
            guard let s = sender as? NSControl else { return }
            v.set(s.stringValue)
        }
    }
    
    public func bindI(valueOf control : NSControl, to v : Var<Int>) {
        self.addResponder(control: control) { (sender) in
            guard let s = sender as? NSControl else { return }
            v.set(s.integerValue)
        }
    }
    
    public func bindI(valueOf control : NSControl, to v : Var<Double>) {
        self.addResponder(control: control) { (sender) in
            guard let s = sender as? NSControl else { return }
            v.set(s.doubleValue)
        }
    }
    
    public func bindI(valueOf control : NSControl, to v : Var<Float>) {
        self.addResponder(control: control) { (sender) in
            guard let s = sender as? NSControl else { return }
            v.set(s.floatValue)
        }
    }
    
    private func addResponder(control : NSControl, withAction action : @escaping (AnyObject?) ->()){
        let r = LinkResponder(action: action)
        control.target = r
        control.action = #selector(LinkResponder.respond(_:))
        
        let d = Disposable {
            control.target = nil
            r.dispose()
        }
        
        disposables.append(d)
    }
    
    deinit {
        disposables = []
    }
    
}
