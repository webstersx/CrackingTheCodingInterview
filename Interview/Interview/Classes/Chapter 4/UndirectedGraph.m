//
//  UndirectedGraph.m
//  Interview
//
//  Created by Shawn Webster on 15/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "UndirectedGraph.h"
#import "Vertex.h"
#import "Queue.h"

@interface UndirectedGraph()

@property (strong, nonatomic) NSMutableDictionary *edges;
@property (strong, nonatomic) NSMutableDictionary *vertices;

@end

@implementation UndirectedGraph

- (id) init {
    if (self = [super init]) {
        self.edges = [NSMutableDictionary dictionary];
        self.vertices = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (void) addVertex:(Vertex*)vertex {
    if (!self.vertices[vertex.key]) {
        self.vertices[vertex.key] = vertex;
    }
}

- (void) addEdgeBetweenVertex:(Vertex*)v andVertex:(Vertex*)w {
    [v.edges addPointer:(__bridge void * __nullable)(w)];
    [w.edges addPointer:(__bridge void * __nullable)(v)];
    
    if (!self.vertices[v.key]) {
        self.vertices[v.key] = v;
    }
    
    if (!self.vertices[w.key]) {
        self.vertices[w.key] = w;
    }
}

- (BOOL) isVertex:(Vertex*)v connectedToVertex:(Vertex*)w {
    if (v == w) {
        return YES;
    }
    
    BOOL connected = NO;

    //Queue => BFS, Stack => DFS
    Queue *toVisit = [Queue new];
    NSMutableSet *visited = [NSMutableSet setWithObject:v];
    
    //add all the originating vertices
    for (Vertex *adjacent in [v.edges allObjects]) {
        [toVisit enqueue:adjacent];
    }
    
    while ([toVisit isEmpty] == NO) {
        Vertex *vv = [toVisit dequeue];
        
        //is this the node you are looking for?
        if (vv == w) {
            connected = YES;
            break;
        }
        
        //nope, mark it as visited, enqueue it's
        [visited addObject:vv];
        
        for (Vertex *adjacent in [vv.edges allObjects]) {
            if ([visited containsObject:adjacent] == NO) {
                [toVisit enqueue:adjacent];
            }
        }
    }
    
    
    return connected;
}

@end
