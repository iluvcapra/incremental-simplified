//
//  IncrementalTests.swift
//  IncrementalTests
//
//  Created by Jamie Hardt on 11/11/17.
//  Copyright © 2017 objc.io. All rights reserved.
//

import XCTest
import Incremental

struct TestStruct : Equatable {
    var a : Int = 1
    var b : String = "Hello, world!"
    
    static func ==( lhs : TestStruct, rhs : TestStruct) -> Bool {
        return lhs.a == rhs.a && lhs.b == rhs.b
    }
}

class IncrementalTests: XCTestCase {
    
    var obs : Disposable?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        obs = nil
        super.tearDown()
    }
    
    func testWriteKeyPath() {
        let t = TestStruct()
        let tv = Var(t)
        
        var vez = 0
        obs = tv.i.observe { (changed) in
            switch(vez) {
                case 0: XCTAssertEqual(1, changed.a)
            case 1: XCTAssertEqual(47, changed.a)
            default: XCTFail("Unexpected value")
            }
            vez = vez + 1
        }
        
        tv.set(TestStruct(a: 47, b: "next"))
        
    }
    
    func testMapKey() {
        let t = TestStruct()
        let tv = Var(t)
        
        let tk = tv.i.map(\TestStruct.b)
        
        var vez = 0
        obs = tk.observe {
            switch(vez) {
            case 0: XCTAssertEqual("Hello, world!", $0)
            case 1: XCTAssertEqual("Again!", $0)
            default: XCTFail("Unexepected value")
            }
            vez = vez + 1
        }
        
        tv.set(keyPath: \TestStruct.b, to: "Again!")
        XCTAssertEqual(vez, 2)

    }
    
}
