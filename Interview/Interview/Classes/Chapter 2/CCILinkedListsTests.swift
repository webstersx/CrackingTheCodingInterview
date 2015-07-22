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
    let l = LinkedList()
    
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
        

        let a = "a"
        let b = "b"
        let c = "c"
        let d = "d"
        let e = "e"
        
        XCTAssertNil(l.head, "an empty list should not have a head")
        XCTAssertNil(l.tail, "an empty list should not have a tail")
        
        //add one item
        l.append(a)
        XCTAssertNotNil(l.head, "after appending one item, the list should now have a head")
        XCTAssertNotNil(l.tail, "after appending one item, the list should now have a tail")
        XCTAssertEqual(l.head, l.tail!, "the head should also be the tail of a list with 1 item")
        XCTAssertEqual(l.head.data as! String, a, "the data of the appended item should be the value that was appended")

        //add another item
        l.append(b)
        XCTAssertNotEqual(l.head, l.tail!, "for a list with two items, the head should not equal the tail")
        
        //add some more
        l.append(c)
        l.append(d)
        l.append(e)
        
        //remove the head, it shouldn't be in the list
        l.removeNode(l.head)
        XCTAssertNotEqual(a, l.head.data as! String, "after removing the head of a list, the removed item's data should not be the data at the head of the list")
        
        //remove the tail, it shouldn't be in the list
        l.removeNode(l.tail)
        XCTAssertNotEqual(e, l.tail?.data as! String, "after removing the tail of a list, the removed item's data hsould not be the data at the tail of the list")
        
        //remove the middle node
        let middleNode = l.head.next
        XCTAssertNotEqual(l.head, middleNode, "in a list of more than 2 items, the node next to head should not be the head of the list")
        XCTAssertNotEqual(l.tail!, middleNode, "in a list of more than 2 items, the node next to head should not be the tail of the list")
        XCTAssertEqual(middleNode.next, l.tail!, "in a list of 3 items, the node next to head should have the tail as its next node")
        l.removeNode(middleNode)
        XCTAssertEqual(l.head.next, l.tail!)
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
    
    func test_2_2() {

        l.append(3)
        l.append(2)
        l.append(1)
        l.append(0)
        
        //off the end
        let k4 = ll.kthLastElement(4, inList:l)
        XCTAssertNil(k4, "a list with fewer elements than k should return nil")
        
        //kth last is head
        let k3 = ll.kthLastElement(3, inList:l)
        XCTAssertEqual(k3.data as! Int, l.head.data as! Int, "the kth last element in a list of size k should be its head")

        let k1 = ll.kthLastElement(1, inList:l)
        XCTAssertEqual(k1.next, l.tail!, "the next to last element should point to the tail")
        
        let k0 = ll.kthLastElement(0, inList:l)
        XCTAssertEqual(k0.data as! Int, l.tail?.data as! Int, "the 0th to last element should be the lists tail")
        
        
    }
    
    func test_2_3() {
        
        let a = "a"
        let b = "b"
        let c = "c"
        let d = "d"
        l.append(a)
        l.append(b)
        l.append(c)
        l.append(d)
        
        //remember that h will stay the same, its the data that changes
        let h = l.head
        let hn = h.next
        ll.forwardRemove(h)
        //... to be continued
        

    }
    
}