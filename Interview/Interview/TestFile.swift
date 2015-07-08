//
//  SwiftFile.swift
//  Interview
//
//  Created by Shawn Webster on 8/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import Foundation

@objc class TestClass {
    
    @objc let string : String = "something"
    
    class func new() -> TestClass {
        return TestClass()
    }
    
    @objc func doSomething() {
        print("doing something")
    }
    
    @objc func returnSomething() -> String {
        return "returning something"
    }
    
}