//
//  Node.m
//  Interview
//
//  Created by Shawn Webster on 21/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "Node.h"

@implementation Node

- (instancetype) initWithData:(id)data {
    self = [super init];
    
    self.data = data;
    
    return self;
}

- (NSString*) description {
    return [self.data description];
}

@end
