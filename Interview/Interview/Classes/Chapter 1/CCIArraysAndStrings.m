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
    
    //TODO: re-do this using a string buffer?
    
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

@end
