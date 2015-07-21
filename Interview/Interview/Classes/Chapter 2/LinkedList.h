//
//  LinkedList.h
//  Interview
//
//  Created by Shawn Webster on 21/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Node;

@interface LinkedList : NSObject

@property (readonly, nonatomic) Node *head;
@property (readonly, nonatomic) Node *tail;
@property (readonly, nonatomic) NSUInteger length;

- (void) prepend:(id)data;
- (void) append:(id)data;
//- (void) remove:(id)data;

//- (void) prependNode:(Node*)node;
//- (void) appendNode:(Node*)node;
/*! Removes the given node - O(n) */
- (void) removeNode:(Node*)node;
/*! Removes the given node providing the prev node for more efficient removal (O(1)) */
- (void) removeNode:(Node *)node previousNode:(Node *)prev;

@end
