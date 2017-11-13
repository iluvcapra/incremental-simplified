//
//  IncrementalUI.swift
//  IncrementalSimplified
//
//  Created by Jamie Hardt on 11/12/17.
//  Copyright © 2017 objc.io. All rights reserved.
//

import Foundation

private class DisposableResponder {
    var action : (AnyObject?) -> ()
    
    init(action a : @escaping (AnyObject?) -> ()) {
        action = a
    }
}

public class VarController<A: Equatable> {
    public var content : Var<A>
    private var disposables : [Any] = []
    
    public init(value v : A) {
        content = Var<A>(v)
    }
    
    public func set(_ newValue : A) {
        content.set(newValue)
    }
    
    public func set<T:Equatable>(keyPath kp : WritableKeyPath<A,T>, to newValue : T) {
        content.set(keyPath: kp, to: newValue)
    }
    
    private func respond(to control : NSControl, action a : @escaping (AnyObject?) -> () ) {
        let responder  = DisposableResponder(action: a)
        disposables.append(responder)
    }
    
}

extension VarController {
    
    private func observe(incremental i : I<String>, writeTo control : NSControl) {
        let d = i.observe { control.stringValue = $0 }
        disposables.append(d)
    }
    
    private func observe(incremental i : I<Int>, writeTo control : NSControl) {
        let d = i.observe { control.integerValue = $0 }
        disposables.append(d)
    }
    
    private func observe(incremental i : I<Float>, writeTo control : NSControl) {
        let d = i.observe { control.floatValue = $0 }
        disposables.append(d)
    }
    
    private func observe(incremental i : I<Double>, writeTo control : NSControl) {
        let d = i.observe { control.doubleValue = $0 }
        disposables.append(d)
    }
}

