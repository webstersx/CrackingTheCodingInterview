//
//  CCILinkedListsTests.swift
//  Interview
//
//  Created by Shawn Webster on 21/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import XCTest

class CCILinkedListsTests: XCTestCase {
    
    let ll = CCILinkedLists()
    
    /*
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
    */
    
    func testNode() {
        let n = Node()
        let m = Node()
        
        n.data = Int(1)
        n.next = m
        m.data = Int(2)
        
        XCTAssertEqual(n.data as! Int, Int(1))
        XCTAssertEqual(m.data as! Int, Int(2))
        XCTAssertEqual(n.next, m)
        XCTAssertNil(m.next)
        
    }
    
    func testLinkedList() {
        
        let l = LinkedList()
        let a = "a"
        let b = "b"
        let c = "c"
        let d = "d"
        let e = "e"
        
        XCTAssertNil(l.head)
        XCTAssertNil(l.tail)
        
        //add one item
        l.append(a)
        XCTAssertNotNil(l.head)
        XCTAssertNotNil(l.tail)
        XCTAssertEqual(l.head.data as! String, a)
        XCTAssertEqual(l.head, l.tail)
        
        //add another item
        l.append(b)
        XCTAssertNotEqual(l.head, l.tail)
        
        //add some more
        l.append(c)
        l.append(d)
        l.append(e)
        
        //remove the head, it shouldn't be in the list
        l.removeNode(l.head)
        XCTAssertNotEqual(a, l.head.data as! String)
        
        //remove the tail, it shouldn't be in the list
        l.removeNode(l.tail)
        XCTAssertNotEqual(e, l.tail.data as! String)
        
        //remove the middle node
        let middleNode = l.head.next
        XCTAssertNotEqual(l.head, middleNode)
        XCTAssertNotEqual(l.tail, middleNode)
        XCTAssertEqual(middleNode.next, l.tail)
        l.removeNode(middleNode)
        XCTAssertEqual(l.head.next, l.tail)
    }
    
    
    func test_2_1() {
        let list = LinkedList()
        
        for i in 1...10 {
            list.append(Int(i%5))
        }

        XCTAssertEqual(list.length, 10)
        ll.removeDupes(list)
        XCTAssertEqual(list.length, 5)
    }
    
}