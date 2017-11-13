//
//  IncrementalAdditions.swift
//  IncrementalSimplified
//
//  Created by Jamie Hardt on 11/12/17.
//  Copyright © 2017 objc.io. All rights reserved.
//

import Foundation

extension I {
    /**
     Creates a I based on a keypath.
     */
    public func map<T:Equatable>(_ path: WritableKeyPath<A,T>) -> I<T> {
        return self.map { $0[keyPath: path] }
    }
}

extension Var {
    /**
     Set a key or keypath on this Var
     */
    public func set<T:Equatable>(keyPath p : WritableKeyPath<A,T>, to newValue: T) {
        change { (this : inout A) in
            this[keyPath: p] = newValue
        }
    }
}
