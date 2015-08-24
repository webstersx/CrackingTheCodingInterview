//
//  BinaryTree.m
//  Interview
//
//  Created by Shawn Webster on 17/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "BinaryTree.h"
#import "BinaryTreeNode.h"

@implementation BinaryTree

//TODO: make this not binary search insertion
- (void) add:(id)value {
    BinaryTreeNode *node = [BinaryTreeNode value:value];
    
    if (!self.root) {
        self.root = node;
    } else {
        BinaryTreeNode *parent = self.root;
        
        while (parent) {
            if (node.value == parent.value) {
                break;
            } else if (node.value < parent.value) {
                if (parent.left) {
                    parent = parent.left;
                } else {
                    parent.left = node;
                    break;
                }
            } else {
                if (parent.right) {
                    parent = parent.right;
                } else {
                    parent.right = node;
                    break;
                }
            }
        }
    }
}

@end
