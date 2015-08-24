//
//  Stack.m
//  Interview
//
//  Created by Shawn Webster on 14/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "Stack.h"
#import "Node.h"

@interface Stack()

@property (strong, nonatomic) Node *head;

@end

@implementation Stack

- (void) push:(id)data {
    
    if (!data) {
        return;
    }
    
    Node *node = [Node new];
    node.data = data;
    node.next = self.head;
    self.head = node;
}

- (id) pop {
    Node *n = self.head;
    self.head = self.head.next;
    return n.data;
}

- (id) peek {
    return self.head.data;
}

- (BOOL) isEmpty {
    return self.head == nil;
}

- (NSString*) description {
    NSMutableString *d = [NSMutableString stringWithFormat:@"[ "];
    
    Node *n = self.head;
    
    while (n) {
        
        [d appendFormat:@"%@", n.data];
        
        if (n.next) {
            [d appendString:@", "];
        }
        
        n = n.next;
    }
    
    [d appendString:@" ]"];
    
    return d.copy;
}

@end
