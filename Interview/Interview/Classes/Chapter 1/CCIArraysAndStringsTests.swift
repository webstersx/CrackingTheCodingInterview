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

}
