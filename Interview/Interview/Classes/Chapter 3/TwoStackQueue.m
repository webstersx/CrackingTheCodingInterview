//
//  TwoStackQueue.m
//  Interview
//
//  Created by Shawn Webster on 14/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "TwoStackQueue.h"
#import "Node.h"
#import "Stack.h"

@interface TwoStackQueue()

@property (strong, nonatomic) Stack *pushStack;
@property (strong, nonatomic) Stack *popStack;

- (void) flipStacks;

@end

@implementation TwoStackQueue

- (id) init {
    if (self = [super init]) {
        self.pushStack = [Stack new];
        self.popStack = [Stack new];
    }
    
    return self;
}

- (void) flipStacks {
    if (self.popStack.isEmpty) {
        while (!self.pushStack.isEmpty) {
            [self.popStack push:[self.pushStack pop]];
        }
    }
}

- (void) enqueue:(id)data {
    [self.pushStack push:data];
}

- (id) dequeue {
    [self flipStacks];
    
    return [self.popStack pop];
}

- (id) peek {
    [self flipStacks];
    
    return [self.popStack peek];
}

- (BOOL) isEmpty {
    return self.pushStack.isEmpty && self.popStack.isEmpty;
}

@end
