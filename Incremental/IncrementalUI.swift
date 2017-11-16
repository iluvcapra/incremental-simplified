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
    
    @objc func respond(_ sender : AnyObject?) {
        action(sender)
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
    
    public func bind<T:Equatable>(keyPath p: WritableKeyPath<A,T>,
                                  toObjectValueOf control : NSControl, withFallback fallbackValue : T) {
        
        observe(incremental: content.i.map(p), writeTo: control)
        respond(to: control) { [weak self] (_) in
            if let validObjectValue = control.objectValue as? T {
                self?.set(keyPath: p, to: validObjectValue)
            } else {
                self?.set(keyPath: p, to: fallbackValue)
            }
            
        }
        
    }
    
    public func observe<T:Equatable>(incremental i : I<T>, writeTo control : NSControl) {
        let d = i.observe {
            control.objectValue = $0
        }
        disposables.append(d)
    }

    private func respond(to control : NSControl, action a : @escaping (AnyObject?) -> () ) {
        let responder  = DisposableResponder(action: a)
        control.target = responder
        control.action = #selector(DisposableResponder.respond(_:))
        disposables.append(responder)
    }
}

