//
//  CCIArraysAndStrings.m
//  Interview
//
//  Created by Shawn Webster on 9/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "CCIArraysAndStrings.h"

@implementation CCIArraysAndStrings


/* 1.1 a) Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
 O(n) space, n = number of characters
 O(n) time
 */
+ (BOOL) hasAllUniqueCharacters:(NSString*)string {
    
    //TODO: re-do this using a string buffer? depends on performance characteristics of NSString().characterAtIndex:
    
    //used hash table to make it clear we're looking for O(1) performance, and don't need to store any value with the key
    NSHashTable *table = [NSHashTable new];
    
    for (NSInteger i=0; i<string.length; i++) {
        unichar c = [string characterAtIndex:i];
        
        if ([table containsObject:@(c)]) {
            return NO;
        } else {
            [table addObject:@(c)];
        }
        
    }
    
    return YES;
}

/* 1.1 b) What if you weren't allowed to use additional data structures?
 
 O(1) space
 O(n^2) time
 */
+ (BOOL) hasAllUniqueCharactersO1Space:(NSString *)string {
    
    for (NSInteger i=0; i<string.length; i++) {
        unichar c = [string characterAtIndex:i];
        
        for (NSInteger j=i+1; j<string.length; j++) {
            unichar d = [string characterAtIndex:j];
            
            if (c == d) {
                return NO;
            }
        }
    }
    
    return YES;
}

/* 1.2 Implement a function void reverse(char* str) in C or C++ which reverses a null- terminated string.
 */

//because I find it really hard to work with char *'s in Swift, I decided to create a helper test function
+ (NSString*) reverse:(NSString*)string {
    
    //duplicate the const char *; let's be safe
    char * buffer = strdup([string UTF8String]);
    
    //perform the in-place reverse
    reverse(buffer);
    
    //return it as an NSString
    return [NSString stringWithUTF8String:buffer];
}

// O(n) time, O(1)? space -- i.e. no extra space used in the actual reversing
void reverse (char * buffer) {
    
    //examplify: \n = \n, a\n = a\n, ab\n = ba\n, abc\n = cba\n
    //pattern matching: straight forward problem
    //simplify & generalise: not necessary
    //base case & build: recursion not necessary
    //data structures brainstorm: it's in-place
    
    /* algorithm:
       - iterate i from 0 to length/2
       - swap i with length - i - 1
     */
    
    //we'll work with the non-null portion of the string
    int length = (int)strlen(buffer) - 1;
    
    //log it out before
    NSLog(@"before: %s", buffer);
    
    //swap characters up until the mid point
    for (int i=0; i<=length/2; i++) {
        char c = buffer[length - i];
        buffer[length - i] = buffer[i];
        buffer[i] = c;
    }
    
    //log it out after
    NSLog(@"after: %s", buffer);
    
}



@end
