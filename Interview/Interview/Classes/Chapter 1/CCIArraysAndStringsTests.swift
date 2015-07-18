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
    
    func test_1_5() {
        
        var s = "aabcccddd"
        var scompressed = "a2b1c3d3"
        var sc = CCIArraysAndStrings.compress(s)
        
        XCTAssertNotEqual(s, sc, "a string which can be compressed should not return the original string")
        XCTAssertEqual(scompressed, sc, "a string which can be compressed should return a compressed string")
        XCTAssertTrue(sc.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < s.lengthOfBytesUsingEncoding(NSUTF8StringEncoding),
            "a string which has been compressed should be shorter than the original string")
        
        s = "abc"
        scompressed = "a1b1c1"
        sc = CCIArraysAndStrings.compress(s)
        
        XCTAssertEqual(s,sc)
        XCTAssertNotEqual(scompressed, sc)
        XCTAssertTrue(s.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) == sc.lengthOfBytesUsingEncoding(NSUTF8StringEncoding),
            "a string which cannot be compressed should be equal to the length of the original string")
    }
    
//TODO: learn how to test 1.6
    
    func test_1_7() {

        //simple cases
        XCTAssertEqual(CCIArraysAndStrings.zeroedMatrix([[]]) as! [Array<Int>], [[]],"an empty matrix should return an empty matrix")
        XCTAssertEqual(CCIArraysAndStrings.zeroedMatrix([[0]]) as! [Array<Int>], [[0]], "a fully zeroed matrix should return itself")
        XCTAssertEqual(CCIArraysAndStrings.zeroedMatrix([[1]]) as! [Array<Int>], [[1]], "a matrix with no zeroes should return itsel")
        XCTAssertEqual(CCIArraysAndStrings.zeroedMatrix([[0,1]]) as! [Array<Int>], [[0, 0]], "a zeroed row should zero the entire row")
        XCTAssertEqual(CCIArraysAndStrings.zeroedMatrix([[0],[1]]) as! [Array<Int>], [[0], [0]], "a zeroed column should zero the entire column")
        

        
        //a complex case
        let sourceMatrix : [Array<Int>] = [
            [0, 1, 1, 1],
            [1, 1, 0, 1],
            [1, 1, 0, 1],
            [1, 1, 1, 1]];
        
        let expectedMatrix : [Array<Int>] = [
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 1, 0, 1]]
        
        XCTAssertEqual(CCIArraysAndStrings.zeroedMatrix(
            sourceMatrix) as! [Array<Int>],
            expectedMatrix,
            "a matrix where elements do not contain a zero in their row or column should be left in tact after zeroing the matrix"
        );

        
    }

}
