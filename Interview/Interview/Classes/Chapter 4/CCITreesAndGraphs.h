//
//  CCITreesAndGraphs.h
//  Interview
//
//  Created by Shawn Webster on 16/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BinaryTree;
@class BinaryTreeNode;
@class BinarySearchTree;
@class LinkedList;

@interface CCITreesAndGraphs : NSObject

//4.3
- (BinarySearchTree*) buildBSTFromObjects:(NSArray*)objects sorted:(BOOL)sorted;

//4.4 - Misinterpreted; only gives linked list at given depth, but not hard to modify to list of lists at each depth
- (LinkedList*) nodesInTree:(BinarySearchTree*)tree atDepth:(NSUInteger)depth;

//4.5
- (BOOL) isBinarySearchTree:(BinaryTree*)tree;

//4.6
- (BinaryTreeNode*) nextNodeInBST:(BinaryTreeNode*)node;

//4.7
- (BinaryTreeNode*) lowestCommonAncestorInTree:(BinaryTree*)tree node1:(BinaryTreeNode*)node1 node2:(BinaryTreeNode*)node2;

//4.8
- (BOOL) isSmallTree:(BinarySearchTree*)t2 subtreeOfLargeTree:(BinarySearchTree*)t1;

@end
