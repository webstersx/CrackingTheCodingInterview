//
//  CCILinkedLists.m
//  Interview
//
//  Created by Shawn Webster on 21/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "CCILinkedLists.h"

#import "LinkedList.h"
#import "Node.h"

@implementation CCILinkedLists


/*! 2.1 Write code to remove duplicates from an unsorted linked list.
 FOLLOW UP
 How would you solve this problem if a temporary buffer is not allowed?
 */

- (void) removeDupes:(LinkedList*)list {
    
    //go through the list, try to fetch each item out of a set
        //if the item was found in the set, remove this object
        //if the item was not found, add it to the set and continue forward
    
    NSMutableSet *set = [NSMutableSet set];
    
    Node *n = list.head;
    Node *prev = nil;
    
    while (n != nil) {
        
        //object not found, add it to the set
        if (![set containsObject:n.data]) {
            [set addObject:n.data];
            prev = n;            
        } else {
            [list removeNode:n previousNode:prev];
        }
        

        n = n.next;
    }
}

/*! 2.2 Implement an algorithm to find the kth to last element of a singly linked list. */
- (Node*) kthLastElement:(NSUInteger)k inList:(LinkedList*)list {
    
    //create a runner as the head of the list
    Node *runner = list.head;
    
    //walk the runner k elements
    while (runner && k>0) {
        runner = runner.next;
        k--;
    }
    
    //if we went too far, this will be nil, otherwise we're about to make it head
    Node *kthLastNode = runner;
    
    //if we didn't go past the end
    if (runner) {
        kthLastNode = list.head;
        while (runner.next) {
            kthLastNode = kthLastNode.next;
            runner = runner.next;
        }
    }
    
    return kthLastNode;
}

/*! 2.3 Implement an algorithm to delete a node in the middle of a singly linked list, given only access to that node.
 EXAMPLE
 Input: the node c from the linked list a->b->c->d->e
 Result: nothing is returned, but the new linked list looks like a- >b- >d->e
 */

//I think this will have an issue if it requires the removal of only the tail because I can't nil out next to the previous node
//Another problem, is this doesn't update tail -- if that's needed

- (void) forwardRemove:(Node*)node {
    
    //can't forward remove tail, have to update the lists tail
    NSParameterAssert(node.next);
    
    //until we're at the 2nd last item
    while (node.next.next != nil) {
        //take the next nodes data and place it in the current node
        node.data = node.next.data;
        //move to the next node
        node = node.next;
    }
    
    //if we're now not at the last element
    if (node.next) {
        //copy the data one more time
        node.data = node.next.data;
        //nil out next
        node.next = nil;
    } else {
        //well shit.
    }

}

@end
