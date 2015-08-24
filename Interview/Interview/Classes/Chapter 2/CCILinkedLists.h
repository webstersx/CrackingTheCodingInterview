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

//2.4
- (void) partitionList:(LinkedList*)list aroundValue:(id)value;

//2.5
- (NSInteger) sumOfList:(LinkedList*)list1 andList:(LinkedList*)list2;

//2.7
- (BOOL) isPalindrome:(LinkedList*)list;

@end


