//
//  IncrementalViewController.swift
//  IncrementalSimplified
//
//  Created by Jamie Hardt on 11/12/17.
//  Copyright © 2017 objc.io. All rights reserved.
//

import Foundation
import AppKit

final class IncrementalViewController : NSViewController {
    
    class LinkResponder: NSObject {
        
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
    
    func link<A:AnyObject>(incremental :I<A> , to control : NSControl) {
        let d = incremental.observe {
            control.objectValue = $0
        }
        
        disposables.append(d)
    }
    
    func link(valueOf control : NSControl, to v : Var<String>) {
        self.addResponder(control: control) { (sender) in
            guard let s = sender as? NSControl else { return }
            v.set(s.stringValue)
        }
    }
    
    func link(valueOf control : NSControl, to v : Var<Int>) {
        self.addResponder(control: control) { (sender) in
            guard let s = sender as? NSControl else { return }
            v.set(s.integerValue)
        }
    }
    
    func link(valueOf control : NSControl, to v : Var<Double>) {
        self.addResponder(control: control) { (sender) in
            guard let s = sender as? NSControl else { return }
            v.set(s.doubleValue)
        }
    }
    
    func link(valueOf control : NSControl, to v : Var<Float>) {
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
