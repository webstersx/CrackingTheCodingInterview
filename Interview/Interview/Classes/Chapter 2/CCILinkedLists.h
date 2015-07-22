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

- (void) removeDupes:(LinkedList*)list;
- (Node*) kthLastElement:(NSUInteger)k inList:(LinkedList*)list;

@end


