//
//  CCIArraysAndStringsTests.swift
//  Interview
//
//  Created by Shawn Webster on 9/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import XCTest

class CCIStacksAndQueuesTests: XCTestCase {
    let sq = CCIStacksAndQueues()
    let dl = DoublyLinkedList()
    
    
    func test_emptyStackIsEmpty() {
        let s = Stack()
        XCTAssertTrue(s.isEmpty())
        XCTAssertNil(s.peek())
    }
    
    func test_emptyPop() {
        let s = Stack()
        s.pop()
        XCTAssertTrue(s.isEmpty())
        XCTAssertNil(s.peek())
    }
    
    func test_oneStackIsNotEmpty() {
        let s = Stack()
        s.push(1)
        XCTAssertFalse(s.isEmpty())
        XCTAssertNotNil(s.peek())
    }
    
    func test_oneStackPopIsEmpty() {
        let s = Stack()
        s.push(1)
        s.pop()
        XCTAssertTrue(s.isEmpty())
        XCTAssertNil(s.peek())
    }
    
    func test_oneStackPush() {
        let s = Stack()
        let value = 1
        s.push(value)
        XCTAssertFalse(s.isEmpty())
        XCTAssertEqual(value, s.peek() as! Int)
    }
    
    func test_twoStackPush() {
        let s = Stack()
        let v1 = 1
        let v2 = 2
        s.push(v1)
        s.push(v2)
        XCTAssertEqual(s.peek() as! Int, v2)
        s.pop()
        XCTAssertEqual(s.peek() as! Int, v1)
    }
    
    func test_twoStackQueue() {
        let q = TwoStackQueue()
        
        let v1 = 1
        let v2 = 2
        
        q.enqueue(v1)
        q.enqueue(v2)
        
        XCTAssertFalse(q.isEmpty())
        XCTAssertEqual(q.peek() as! Int, v1)
        XCTAssertEqual(q.dequeue() as! Int, v1)
        XCTAssertEqual(q.peek() as! Int, v2)
        q.dequeue()
        XCTAssertTrue(q.isEmpty())
        
    }
    
    func test_petShelter() {
        let ps = PetShelter()
        
        var dog = ps.dequeueDog()
        XCTAssertNil(dog, "when there are no dogs, dequeueing a dog should return nil")
        
        var pet = ps.dequeueAny()
        XCTAssertNil(pet, "when there are no pets, dequeueing anything should return nil")
        
        var cat = ps.dequeueCat()
        XCTAssertNil(cat, "when there are no cats, dequeueing a cat hsould return nil")
        
        ps.enqueue(Dog(data: "woof"))
        ps.enqueue(Cat(data: "meow"))
        ps.enqueue(Cat(data: "meowsa"))
        ps.enqueue(Dog(data: "sir wooferson"))
        
        cat = ps.dequeueCat()
        XCTAssertEqual(cat.data as! String, "meow", "dequeueing a cat should return the first cat when the next pet is a dog")
        
        pet = ps.dequeueAny()
        XCTAssertEqual(pet.data as! String, "woof", "dequeueing anything should return the first pet, in this case a dog")
        
        dog = ps.dequeueDog()
        XCTAssertEqual(dog.data as! String, "sir wooferson", "dequeueing a dog should return the first dog when the next pet is a cat")
        
        cat = ps.dequeueCat()
        XCTAssertNotNil(cat, "dequeueing a cat should return the first item when the cat is the next pet")
        

        
        
    }
}
