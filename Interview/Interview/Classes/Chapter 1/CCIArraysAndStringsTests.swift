//
//  CCIArraysAndStringsTests.swift
//  Interview
//
//  Created by Shawn Webster on 9/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import XCTest

class CCIArraysAndStringsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_1_1a() {
        XCTAssertFalse(CCIArraysAndStrings.hasAllUniqueCharacters("not unique"))
        XCTAssertTrue(CCIArraysAndStrings.hasAllUniqueCharacters("uniqe"));
    }
    
    func test_1_1b() {
        XCTAssertFalse(CCIArraysAndStrings.hasAllUniqueCharactersO1Space("not unique"))
        XCTAssertTrue(CCIArraysAndStrings.hasAllUniqueCharactersO1Space("uniqe"))
    }
    
    func test_1_2() {
        let originalString = "abc"
        
        //reverse it
        let reversedString = CCIArraysAndStrings.reverse(originalString)
        XCTAssertEqual(reversedString, "cba")
        
        //re-reverse it, should get the original
        let reReversedString = CCIArraysAndStrings.reverse(reversedString)
        XCTAssertEqual(originalString, reReversedString)
        
        XCTAssertEqual(CCIArraysAndStrings.reverse(""), "")
        XCTAssertEqual(CCIArraysAndStrings.reverse("a"), "a")
        XCTAssertEqual(CCIArraysAndStrings.reverse("ab"), "ba")
        XCTAssertEqual(CCIArraysAndStrings.reverse("abcd"), "dcba")
        XCTAssertEqual(CCIArraysAndStrings.reverse("racecar"), "racecar")
    }
    
    func test_1_3() {
        XCTAssertTrue(CCIArraysAndStrings.isString("abc", permutationOf: "bca"))
        XCTAssertFalse(CCIArraysAndStrings.isString("abc", permutationOf: "def"))
    }
    
    func test_1_4() {
        var inString = NSMutableString(string: "nospaces")
        CCIArraysAndStrings.encodeSpaces(inString, length:"nospaces".lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        print("inString = \(inString)")
        XCTAssertEqual(inString, "nospaces")
        
        //test one spaces
        inString = NSMutableString(string: "one space//")
        CCIArraysAndStrings.encodeSpaces(inString, length:"one space".lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        print("inString = \(inString)")
        XCTAssertEqual(inString, "one%20space")
        
        //test two spaces -> !! this caught an error where I didn't move the ' ' replacement over to accommodate more spaces before this one
        inString = NSMutableString(string: "two spaces here////")
        CCIArraysAndStrings.encodeSpaces(inString, length:"two spaces here".lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        print("inString = \(inString)")
        XCTAssertEqual(inString, "two%20spaces%20here")
    }

}
