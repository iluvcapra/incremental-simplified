//
//  IncrementalAdditions.swift
//  IncrementalSimplified
//
//  Created by Jamie Hardt on 11/12/17.
//  Copyright © 2017 objc.io. All rights reserved.
//

import Foundation

extension I {
    public func map<T:Equatable>(_ p: WritableKeyPath<A,T>) -> I<T> {
        return self.map { $0[keyPath: p] }
    }
}

extension Var {
    public func set<T:Equatable>(keyPath p : WritableKeyPath<A,T>, to newValue: T) {
        change { (this : inout A) in
            this[keyPath: p] = newValue
        }
    }
}
