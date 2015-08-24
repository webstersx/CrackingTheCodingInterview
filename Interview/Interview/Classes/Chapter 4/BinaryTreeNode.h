//
//  BinaryNode.h
//  Interview
//
//  Created by Shawn Webster on 15/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject

@property (strong, nonatomic) id value;
@property (strong, nonatomic) BinaryTreeNode *left;
@property (strong, nonatomic) BinaryTreeNode *right;
@property (strong, nonatomic) BinaryTreeNode *parent;

+ (BinaryTreeNode*) value:(id)value;
- (NSUInteger) height;
- (BOOL) balanced;
- (NSComparisonResult) compare:(BinaryTreeNode*)otherNode;

@end
