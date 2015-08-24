//
//  UndirectedGraph.h
//  Interview
//
//  Created by Shawn Webster on 15/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vertex;

@interface UndirectedGraph : NSObject

- (void) addVertex:(Vertex*)vertex;
- (void) addEdgeBetweenVertex:(Vertex*)v andVertex:(Vertex*)w;
- (BOOL) isVertex:(Vertex*)v connectedToVertex:(Vertex*)w;

@end
