//
//  BinaryTree.m
//  Interview
//
//  Created by Shawn Webster on 15/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "BinarySearchTree.h"
#import "BinaryTreeNode.h"

@implementation BinarySearchTree

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
        
        node.parent = parent;
    }
}

- (NSInteger) height {
    return self.root ? [self.root height] : 0;
}

- (BOOL) balanced {
    return self.root ? [self.root balanced] : YES;
}

- (NSString*) description {
    return self.root.description;
}

@end
