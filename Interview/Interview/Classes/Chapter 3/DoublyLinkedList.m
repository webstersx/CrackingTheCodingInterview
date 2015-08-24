//
//  DoublyLinkedList.m
//  Interview
//
//  Created by Shawn Webster on 14/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "DoublyLinkedList.h"
#import "DoublyLinkedNode.h"

@implementation DoublyLinkedList

- (void) append:(id)data {
    DoublyLinkedNode *node = [DoublyLinkedNode new];
    node.data = data;
    node.prev = self.tail;
    
    [super appendNode:node];
}

- (void) prepend:(id)data {
    DoublyLinkedNode *lastHead = (DoublyLinkedNode*)self.head;
    
    [super prepend:data];
    
    lastHead.prev = self.head;
}

- (void) removeNode:(DoublyLinkedNode *)node {
    //back-link the next item to the prev node
    DoublyLinkedNode *next = (DoublyLinkedNode*)node.next;
    next.prev = (DoublyLinkedNode*)node.prev;
    node.prev = nil;
    
    //then remove as per normal
    [super removeNode:node];
}

- (void) removeNode:(DoublyLinkedNode *)node previousNode:(DoublyLinkedNode *)prev {
    DoublyLinkedNode *next = (DoublyLinkedNode*)node.next;
    
    //point the next node
    next.prev = prev;
    
    [super removeNode:node previousNode:prev];
}

@end
