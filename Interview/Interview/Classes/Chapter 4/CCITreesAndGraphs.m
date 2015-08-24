//
//  CCITreesAndGraphs.m
//  Interview
//
//  Created by Shawn Webster on 16/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "CCITreesAndGraphs.h"
#import "Queue.h"
#import "LinkedList.h"
#import "Node.h"
#import "BinarySearchTree.h"
#import "BinaryTreeNode.h"

@implementation CCITreesAndGraphs

- (BinarySearchTree*) buildBSTFromObjects:(NSArray*)objects sorted:(BOOL)sorted {
    
    if (objects.count == 0) {
        return nil;
    }
    
    if (!sorted) {
        objects = [objects sortedArrayUsingSelector:@selector(compare:)];
    }
    
    NSUInteger midPoint = objects.count/2;
    
    BinarySearchTree *tree = [BinarySearchTree new];
    [tree add: objects[midPoint]];
    
    BinarySearchTree *leftTree = [self buildBSTFromObjects:[objects subarrayWithRange:NSMakeRange(0, midPoint)]
                                                    sorted:YES];
    BinarySearchTree *rightTree = [self buildBSTFromObjects:[objects subarrayWithRange:NSMakeRange(midPoint+1, objects.count -1 > midPoint ? objects.count -1 - midPoint: 0)]
                                                     sorted:YES];
    
    [tree.root setLeft:leftTree.root];
    [tree.root setRight:rightTree.root];
    
    return tree;
}

- (LinkedList*) nodesInTree:(BinarySearchTree*)tree atDepth:(NSUInteger)depth {
    LinkedList *l = [LinkedList new];
    Queue *pq = [Queue new];
    Queue *cq = [Queue new];
    [pq enqueue:tree.root];
    
    NSUInteger d = 0;
    BinaryTreeNode *n;
    
    //queue child nodes iteratively until we're at the desired depth
    while (d < depth && (n = [pq dequeue])) {
        //add left and right nodes to child queue
        [cq enqueue:n.left];
        [cq enqueue:n.right];
        
        //when this queue is empty
        if ([pq isEmpty]) {
            //move on to the child queue and increase current depth by 1
            pq = cq;
            d++;
            //start a new child queue
            cq = [Queue new];
        }
    }
    
    //we ran out of nodes before we could get to this depth
    if ([pq isEmpty]) {
        l = nil;
    }
    
    while (![pq isEmpty]) {
        [l append:[pq dequeue]];
    }
    
    return l;
}

- (BOOL) isBinarySearchTree:(BinaryTree*)tree {
    return [self isBinarySearchTreeNode:tree.root];
}

- (BOOL) isBinarySearchTreeNode:(BinaryTreeNode*)node {
    
    //check left side
    if (node.left) {
        //node must be greater than left; left must be a binary search node recursively
        if (node.value <= node.left.value || ![self isBinarySearchTreeNode:node.left]) {
            return NO;
        }
    }
    
    //check right side
    if (node.right) {
        //node must be less than right; right must be a binary search node recursively
        if (node.value >= node.right.value || ![self isBinarySearchTreeNode:node.right]) {
            return NO;
        }
    }
    
    return YES;
}

- (BinaryTreeNode*) nextNodeInBST:(BinaryTreeNode*)node {
    
    BinaryTreeNode *nextNode = nil;
    
    //either to the right of this node
    if (node.right) {
        nextNode = node.right;
        while (nextNode.left) {
            nextNode = nextNode.left;
        }
    }
    //or parent if we are less than the parent
    else if (node.parent.value > node.value ) {
        nextNode = node.parent;
    }
    
    return nextNode;
}

- (BinaryTreeNode*) lowestCommonAncestorInTree:(BinarySearchTree*)tree node1:(BinaryTreeNode*)node1 node2:(BinaryTreeNode*)node2 {
    BinaryTreeNode *n = tree.root;
    
    //swap so we know that node1 is always <= node2
    if (node1.value > node2.value) {
        BinaryTreeNode *tn = node1;
        node1 = node2;
        node2= tn;
    }
    
    while (n) {
        if (node1.value <= n.value && node2.value >= n.value) {
            break;
        } else if (node2.value < n.value) {
            //we know node1 < node2
            n = n.left;
        } else if (node1.value > n.value) {
            n = n.right;
        }
        
        if (n.value == node1.value || n.value == node2.value) {
            break;
        }
    }
    
    //if node1 is in left subtree && node2 is in right subtree
        //return n
    
    //if node1 and node2 are in same subtree
        //move n to left or right

        //if n is now node1 or node 2
            //return n
    
    //if one isn't in a subtree, we went too far
    
    return n;
}

- (BOOL) isSmallTree:(BinarySearchTree*)t2 subtreeOfLargeTree:(BinarySearchTree*)t1 {
    
    //find t2.root in t1
    BinaryTreeNode *n = t1.root;
    while (n) {
        
        if (t2.root.value < n.value) {
            n = n.left;
        } else if (t2.root.value > n.value) {
            n = n.right;
        } else {
            //n = t2
            break;
        }
    }
    
    //couldn't find t2.root in t1
    if (!n) {
        return NO;
    }
    
    //move n all the way left; move n2 at the same time, assuming we have the same node hierarchy (else fail anyway)
    BinaryTreeNode *n2 = t2.root;
    while (n.left) {
        n = n.left;
        n2 = n2.left;
    }
    
    //go next-next until we reach the end of T2
    while (n2) {
        //if we reached the end of T1 or the values aren't the same; can't be a subtree
        if (n == nil || n.value != n2.value) {
            return NO;
        }
        
        //get the next node
        n = [self nextNodeInBST:n];
        n2 = [self nextNodeInBST:n2];
    }
    
    //we exhausted T2 and it wasn't not the same... so ... yay!
    return YES;
}

@end
