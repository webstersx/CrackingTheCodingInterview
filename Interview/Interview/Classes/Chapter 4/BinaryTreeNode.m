//
//  BinaryNode.m
//  Interview
//
//  Created by Shawn Webster on 15/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode

+ (BinaryTreeNode*) value:(id)value {
    BinaryTreeNode *node = [BinaryTreeNode new];
    node.value = value;
    return node;
}

//height of this tree
- (NSUInteger) height {
    return 1 + MAX([self.left height], [self.right height]);
}

//the height of the subtrees are off by no more than 1
//http://stackoverflow.com/questions/8015630/definition-of-a-balanced-tree
- (BOOL) balanced {
    
    BOOL balanced = YES;
    
    NSUInteger lh = [self.left height];
    NSUInteger rh = [self.right height];
    NSUInteger heightDifference = (lh >= rh ? lh - rh : rh - lh);
    
    //balanced unless one of these conditions is met: height diff too large, left/right subtree (if exists) isn't balanced
    if (heightDifference > 1 ||
        (self.left && ![self.left balanced]) ||
        (self.right && ![self.right balanced])) {
        balanced = NO;
    }
    
    return balanced;
}

#pragma mark - Equality and Comparison
- (NSUInteger) hash {
    return [self.value hash];
}

- (BOOL) isEqual:(id)object {
    if ([object isKindOfClass:[self class]]) {
        return [self isEqualToNode:object];
    }
    
    return [self.value isEqual:object];
}

- (BOOL) isEqualToNode:(BinaryTreeNode*)otherNode {
    return [self.value compare:otherNode.value] == NSOrderedSame;
}

- (NSComparisonResult) compare:(BinaryTreeNode*)otherNode {
    return [self.value compare:otherNode.value];
}

#pragma mark - Description
- (NSString*) description {
    return [NSString stringWithFormat:
            @"{ %@ %@ %@ }",
            self.left ? self.left.description : @"",
            self.value,
            self.right ? self.right.description : @""];
}

@end
