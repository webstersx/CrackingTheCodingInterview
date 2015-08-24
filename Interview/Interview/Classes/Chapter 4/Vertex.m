//
//  Vertex.m
//  Interview
//
//  Created by Shawn Webster on 15/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "Vertex.h"

@interface Vertex()

@property (strong, nonatomic) id<NSCopying> key;

@end

@implementation Vertex

+ (Vertex*) vertexWithKey:(id<NSCopying>)key object:(id)object {
    Vertex *vertex = [Vertex new];
    vertex.key = [key copyWithZone:nil];
    vertex.object = object;
    return vertex;
}

- (id) init {
    if (self = [super init]) {
        self.edges = [NSPointerArray weakObjectsPointerArray];
    }
    
    return self;
}

@end
