//
//  BinaryTree.h
//  Interview
//
//  Created by Shawn Webster on 17/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BinaryTreeNode;

@interface BinaryTree : NSObject

@property (strong, nonatomic) BinaryTreeNode *root;

- (void) add:(id)value;


@end
