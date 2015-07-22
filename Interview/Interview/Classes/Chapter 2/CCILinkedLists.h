//
//  CCILinkedLists.h
//  Interview
//
//  Created by Shawn Webster on 21/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LinkedList;
@class Node;

@interface CCILinkedLists : NSObject

//2.1
- (void) removeDupes:(LinkedList*)list;

//2.2
- (Node*) kthLastElement:(NSUInteger)k inList:(LinkedList*)list;

//2.3
- (void) forwardRemove:(Node*)node;

@end


