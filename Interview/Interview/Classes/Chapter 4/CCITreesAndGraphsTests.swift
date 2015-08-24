//
//  CCITreesAndGraphsTests.swift
//  Interview
//
//  Created by Shawn Webster on 15/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

import XCTest

class CCITreesAndGraphsTests: XCTestCase {
    var bst = BinarySearchTree()
    let tg = CCITreesAndGraphs()
    
    
    func test_emptyTree() {
        XCTAssertNil(bst.root)
        XCTAssertEqual(bst.height(), 0, "an empty tree should have a height of 0")
        XCTAssertTrue(bst.balanced(), "an empty tree is balanced")
    }
    
    func test_oneNodeTree() {
        bst.add("a")
        XCTAssertNotNil(bst.root)
        XCTAssertEqual(bst.height(), 1, "a tree with one node should have a height of 1")
        XCTAssertTrue(bst.balanced(), "a 1-node tree is balanced")
    }
    
    func test_twoNodeTree() {
        bst.add(2)
        bst.add(1)
        
        XCTAssertEqual(bst.root.left.value as! Int, 1, "1 should be on the left of 2 when 2 is root")
        XCTAssertEqual(bst.height(), 2, "a tree with two elements should have a height of 2")
        XCTAssertTrue(bst.balanced(), "a 2-node tree is balanced")
    }
    
    func test_threeHeightTree() {
        
        bst.add(3)
        bst.add(1)
        bst.add(2)
        
        XCTAssertEqual(bst.root.value as! Int, 3, "3 should be at the root")
        XCTAssertEqual(bst.root.left.value as! Int, 1, "1 should be to the left of 3")
        XCTAssertEqual(bst.root.left.right.value as! Int, 2, "2 should be to the right of 1 and on the left half of a tree rooted with 3")
        XCTAssertEqual(bst.height(), 3, "the tree hsould have a height of 3")
        XCTAssertFalse(bst.balanced(), "the tree should not be balanced")
    }
    
    func test_balancedTwoHeightTree() {
        bst.add(2)
        bst.add(1)
        bst.add(3)
        
        XCTAssertEqual(bst.root.value as! Int, 2, "2 should be at the root")
        XCTAssertEqual(bst.root.left.value as! Int, 1, "1 should be to the left of 2")
        XCTAssertEqual(bst.root.right.value as! Int, 3, "3 should be to the right of 2")
        XCTAssertEqual(bst.height(), 2, "the tree hsould have a height of 3")
        XCTAssertTrue(bst.balanced(), "the tree should not be balanced")
    }
    
    func test_complexBalanced() {
        //insertion order: 14 12 11 17 16 15 18 (later: 13, 10, 9)
        bst.add(14)
        bst.add(12)
        bst.add(11)
        bst.add(17)
        bst.add(16)
        bst.add(15)
        
        XCTAssertFalse(bst.balanced(), "this tree should not be balanced because the node 6 has a left height of 2 and a right height of 0")
        
        bst.add(18)
        XCTAssertTrue(bst.balanced(), "this tree is balanced")
        
        bst.add(13)
        XCTAssertTrue(bst.balanced(), "this tree should still be balanced")
        
        bst.add(10)
        XCTAssertTrue(bst.balanced(), "this stree is still considered balanced but slightly left-heavy")
        
        bst.add(9)
        XCTAssertFalse(bst.balanced(), "this tree should now be left-heavy and imbalanced")
    }
    
    func test_graph() {
        let g = UndirectedGraph()
        
        let v = Vertex(key: "v", object: 1)
        let w = Vertex(key: "w", object: 2)
        let x = Vertex(key: "x", object: 3)
        let y = Vertex(key: "y", object: 4)
        let z = Vertex(key: "z", object: 5)

        //v-w
        g.addEdgeBetweenVertex(v, andVertex: w)
        var conn = g.isVertex(v, connectedToVertex: y)
        XCTAssertFalse(conn, "v and y are not connected")
        
        conn = g.isVertex(v, connectedToVertex: w)
        XCTAssertTrue(conn, "v and w are directly conected")
        
        //v-w  x-y-z
        g.addEdgeBetweenVertex(x, andVertex: y)
        g.addEdgeBetweenVertex(y, andVertex: z)
        conn = g.isVertex(x, connectedToVertex: z)
        XCTAssertTrue(conn, "x and z are indirectly connected")
        
        //v-w  x-y
        //     |/
        //     z
        g.addEdgeBetweenVertex(x, andVertex: z)
        conn = g.isVertex(x, connectedToVertex: z)
        XCTAssertTrue(conn, "x and z are now directly connected")
    }
    
    func test_buildBST() {
        
        bst = tg.buildBSTFromObjects([1], sorted: true)
        XCTAssertEqual(bst.root.value as! Int, 1)
        
        bst = tg.buildBSTFromObjects([1,2], sorted: true)
        XCTAssertEqual(bst.root.value as! Int, 2, "2 should be at the root")
        XCTAssertEqual(bst.root.left.value as! Int, 1, "1 should be to the left of 2")
        
        bst = tg.buildBSTFromObjects([1,2,3], sorted: true)
        XCTAssertEqual(bst.root.value as! Int, 2, "2 should be at the root")
        XCTAssertEqual(bst.root.left.value as! Int, 1, "1 should be to the left of 2")
        XCTAssertEqual(bst.root.right.value as! Int, 3, "3 should be to the right of 2")
    }
    
    func test_nodesAtDepth() {
        let tg = CCITreesAndGraphs()
        let t = BinarySearchTree()
        
        //      4
        //   2     6
        //  1 3   5 7
        t.add(4)
        t.add(2)
        t.add(6)
        t.add(1)
        t.add(3)
        t.add(5)
        t.add(7)
        
        
        var l = tg.nodesInTree(t, atDepth: 0)
        XCTAssertEqual((l.head.data as! BinaryTreeNode).value as! Int, 4)
        
        l = tg.nodesInTree(t, atDepth: 1)
        XCTAssertEqual((l.head.data as! BinaryTreeNode).value as! Int, 2)
        XCTAssertEqual((l.head.next.data as! BinaryTreeNode).value as! Int, 6)
        
        l = tg.nodesInTree(t, atDepth: 2)
        XCTAssertEqual((l.head.data as! BinaryTreeNode).value as! Int, 1)
        XCTAssertEqual((l.head.next.data as! BinaryTreeNode).value as! Int, 3)
        XCTAssertEqual((l.head.next.next.data as! BinaryTreeNode).value as! Int, 5)
        XCTAssertEqual((l.head.next.next.next.data as! BinaryTreeNode).value as! Int, 7)
        
        l = tg.nodesInTree(t, atDepth: 3)
        XCTAssertNil(l)

    }
    
    func test_isBinarySearchTree() {
        let t = BinaryTree()
        
        XCTAssertTrue(tg.isBinarySearchTree(t), "a tree with no nodes is kind of a bst")
        
        t.add(2)
        XCTAssertTrue(tg.isBinarySearchTree(t), "a tree with one node is a bst")
        
        t.add(1)
        t.add(3)
        XCTAssertTrue(tg.isBinarySearchTree(t), "a tree with 2 at its root, 1 to its left and 3 to its right is a bst")
        
        t.root.value = 4
        XCTAssertFalse(tg.isBinarySearchTree(t), "a tree with 4 at its root and 3 to its right is not a bst")
    }
    
    func test_bstNextNode() {
        
        bst.add(0)
        bst.add(2)
        bst.add(1)
        bst.add(3)
        bst.add(5)
        bst.add(4)
        
        var next = bst.root
        
        XCTAssertEqual(next.value as! Int, 0)
        
        next = tg.nextNodeInBST(next)
        XCTAssertEqual(next.value as! Int, 1, "the next node after 0 is 1")
        
        next = tg.nextNodeInBST(next)
        XCTAssertEqual(next.value as! Int, 2, "the next node after 1 is 2")
        
        next = tg.nextNodeInBST(next)
        XCTAssertEqual(next.value as! Int, 3, "the next node after 2 is 3")

        next = tg.nextNodeInBST(next)
        XCTAssertEqual(next.value as! Int, 4, "the next node after 3 is 4")
        
        next = tg.nextNodeInBST(next)
        XCTAssertEqual(next.value as! Int, 5, "the next node after 4 is 5")

        next = tg.nextNodeInBST(next)
        XCTAssertNil(next, "there are no nodes after 5")

    }
    
    //TODO: more tests
    func test_lowestCommonAncestor() {
        bst.add(12)
        bst.add(11)
        bst.add(13)
        bst.add(16)
        bst.add(15)
        bst.add(14)
        
        var n = tg.lowestCommonAncestorInTree(bst, node1: bst.root.left, node2: bst.root.right)
        XCTAssertEqual(n, bst.root)
        
        n = tg.lowestCommonAncestorInTree(bst, node1: bst.root.right.right, node2: bst.root.right.right.left)
        XCTAssertEqual(n, bst.root.right.right)
        
    }
}
