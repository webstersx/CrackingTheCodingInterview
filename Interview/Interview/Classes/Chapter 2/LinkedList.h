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
@property (weak, readonly, nonatomic) Node *tail;
@property (readonly, nonatomic) NSUInteger length;

//adding data
- (void) prepend:(id)data;
- (void) append:(id)data;

//adding nodes
- (void) prependNode:(Node*)node;
- (void) appendNode:(Node*)node;

/*! Dangerously points the given node to head without making any extra modifications to the list */
- (void) updateHeadNode:(Node*)newHead tailNode:(Node*)newTail;

//removing data/nodes
//- (void) remove:(id)data; //O(n), remove all nodes with this data
/*! Removes the given node - O(n) */
- (void) removeNode:(Node*)node;
/*! Removes the given node providing the prev node for more efficient removal (O(1)) */
- (void) removeNode:(Node *)node previousNode:(Node *)prev;

@end
