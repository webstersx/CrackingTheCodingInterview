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

/* I REALLY DONT LIKE THIS! If the node is in a list, it can mess up a whole bunch of the internal mechanisms of the list, such as if the list has a tail, the length of the list, and this just flat out would not work for a singly linked list where you can't disassociate the node if it's the only one to remove.
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

/*! 2.4 Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x.
 */

//method 1: 3 sets = less than on the left; equal to on the right; greater than on the right O(2*n) time, O(n) space
//method 2: start from head until original node (original = might have duplicates)
//              if less than node, keep in place; if greater than node, move the previous node past this, put this right after node
//              if equal to node, put it after node and move node
//          at original node, move to node (last instance)
//      !! -> at this point, i realise that this will result in duplicate work when you examine nodes that already got moved
//method 3: examine every node, remove it and place it into a new list -> this doesn't work in place -> so walk it again after and copy the data values into original
//method 4: i'm pretty sure this is very similar to a specific recursive sort algorithm
//method 5: keep 3 nodes, less than, equal to, greater than
- (void) partitionList:(LinkedList*)list aroundValue:(id)value {
    

    Node *before = nil, *equal = nil, *after = nil;
    Node *beforeTail = nil, *equalTail = nil, *afterTail = nil;
    
    //walk
    Node *node = list.head;
    while (node != nil) {
        
        //get next node
        Node *next = node.next;
        
        //prepare this node for use as a base list
        node.next = nil;
        
        //compare the value
        NSComparisonResult comparisonResult = [node.data compare:value];
        
        if (comparisonResult == NSOrderedAscending) {
            //if it's not the start of the sub-list, link it to the existing start
            if (before != nil) {
                node.next = before;
            } else {
                beforeTail = node;
            }
            
            before = node;
        } else if (comparisonResult == NSOrderedDescending) {
            if (after != nil) {
                node.next = after;
            } else {
                afterTail = node;
            }
            
            after = node;
        } else { //NSOrderedSame
            if (equal != nil) {
                node.next = equal;
            } else {
                equalTail = node;
            }
            
            equal = node;
        }

        //assign the next node to examine
        node = next;
    }
    
    //link the lists together
    beforeTail.next = equal;
    equalTail.next = after;
    
    //sets the earliest node as head, sets the latest node as tail
    [list updateHeadNode:before ? before : equal ? equal : after ? after : nil
                tailNode:afterTail ? afterTail : equalTail ? equalTail : beforeTail ? beforeTail : nil];
}

- (NSInteger) sumOfList:(LinkedList*)list1 andList:(LinkedList*)list2 {
    
    NSInteger pow = 0;
    
    NSInteger sum = 0;
    
    Node *n1 = list1.head;
    Node *n2 = list2.head;
    
    while (n1 || n2) {
        
        sum += ([n1.data integerValue] + [n2.data integerValue]) * powl(10,pow);
        
        n1 = n1.next;
        n2 = n2.next;
        
        pow++;
    }
    
    
    return sum;
    
}


//method 1, create a full reverse
//method 2, create a half reverse, half compare using a runner (slightly faster for larger lists)
- (BOOL) isPalindrome:(LinkedList*)list {
    
    Node *cur = list.head;
    Node *runner = cur;
    
    //odd, when runner.next is nil, take midpoint as cur: 1, 2, 3
    //even, when runner.next.next is nil, take midpoint as cur: 1, 2, 3, 4
    while (runner.next && runner.next.next) {
        cur = cur.next;
        runner = runner.next.next;
    }
    
    //move cur one more element
    cur = cur.next;
    
    //create a reverse linked list up to the mid point
    LinkedList *reverseList = [LinkedList new];
    
    //prepend each element so the mid point is at the end
    while (cur) {
        [reverseList prepend:cur.data];
        cur = cur.next;
    }
    
    //now compare
    
    cur = reverseList.head;
    runner = list.head;
    
    while (cur) {
        if ([cur.data compare:runner.data] != NSOrderedSame) {
            return NO;
        }
        
        cur = cur.next;
        runner = runner.next;
    }
    
    
    return  cur == nil;
}

@end
