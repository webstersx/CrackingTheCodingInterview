//
//  Queue.m
//  Interview
//
//  Created by Shawn Webster on 16/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "Queue.h"
#import "Node.h"

@interface Queue()

@property (strong, nonatomic) Node *head;
@property (weak, nonatomic) Node *tail;

@end

@implementation Queue

- (void) enqueue:(id)data {
    
    if (!data) {
        return;
    }
    
    Node *n = [Node new];
    n.data = data;
    
    if ([self isEmpty]) {
        self.head = n;
    } else {
        self.tail.next = n;
    }

    self.tail = n;
}

- (id) dequeue {
    Node *n = self.head;
    self.head = n.next;
    return n.data;
}

- (id) peek {
    return self.head.data;
}

- (BOOL) isEmpty {
    return self.head == nil;
}

@end
