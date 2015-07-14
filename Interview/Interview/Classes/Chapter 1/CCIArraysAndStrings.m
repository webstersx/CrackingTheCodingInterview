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

/* 1.3 Given two strings, write a method to decide if one is a permutation of the other.
 */
+ (BOOL) isString:(NSString*)string1 permutationOf:(NSString*)string2 {
    NSCountedSet *set1 = [self permutationSet:string1];
    NSCountedSet *set2 = [self permutationSet:string2];
    return [set1 isEqualToSet:set2];
}

+ (NSCountedSet*) permutationSet:(NSString*)string {
    NSCountedSet *set = [NSCountedSet new];
    
    for (NSInteger i=0; i<string.length; i++) {
        unichar c = [string characterAtIndex:i];
        [set addObject:@(c)];
    }
    
    return set;
}

/* 1.4 Write a method to replace all spaces in a string with'%20'. You may assume that the string has sufficient space at the end of the string to hold the additional characters, and that you are given the "true" length of the string. (Note: if imple- menting in Java, please use a character array so that you can perform this opera- tion in place.)
 EXAMPLE
 Input: "Mr John Smith Output: "Mr%20Dohn%20Smith"
 */

//examplify: example given
//pattern matching: straight forward problem -> find all positions of ' ', move elements at index > ' ' 3 * # of later spaces over?
//simplify & generalise: doesn't help
//base case & build: not appropriate
//data structures brainstorm: it's in-place; another array for all characters O(n)

//time: O(n) (walk string twice, worst case replace every character with %20)
//space: O(n) (array of spaces, worst case all spaces)
+ (void) encodeSpaces:(NSMutableString*)string length:(NSInteger)n {
    /* I could easily just [string stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
       but that's not really in the spirit of the task
    
       walk the string until index of trueLength
       capture all the indexes of the of the spaces in an array
       walk the string backwards from trueLength as i
         i=char, n=last index,
           when i > n, move 2 * spaceArray.length forward
           when i == n, set i, i+1, i+2 to '%20', remove last object <-- EPF: this is wrong, (numSpaces-i*2)+i not just i
     */
    
    //EPF (ex-post-facto): => check for nil, check length of string >= n
    //EPF: check that string is actually mutable

    //EPF: no need for the index, capture it later
    NSInteger spaceIndex = NSNotFound;
    NSMutableArray *spaces = [NSMutableArray array];
    
    for (NSInteger i=0; i<n; i++) {
        if ([string characterAtIndex:i] == ' ') {
            [spaces addObject:@(i)];
            spaceIndex = i;
        }
    }
    
    //EPF: could do spaces.count > 0, capture index then
    if (spaceIndex != NSNotFound) {
        
        //EPF: assert length >= given length + (2 * num spaces); or else we won't have enough room
        
        for (NSInteger i=n-1; i>=0; i--) {
            if (i > spaceIndex) {
                NSRange rng = NSMakeRange(spaces.count * 2 + i, 1);
                NSString *s = [string substringWithRange:NSMakeRange(i, 1)];
                [string replaceCharactersInRange:rng withString:s];
            } else if (i == spaceIndex) {
                NSRange rng = NSMakeRange((spaces.count - 1) * 2 + i, 3);
                [string replaceCharactersInRange:rng withString:@"%20"];
                
                [spaces removeLastObject];
                
                if (spaces.count > 0) {
                    spaceIndex = [((NSNumber*)spaces.lastObject) integerValue];
                } else {
                    break;
                }
            } //else i < spaceIndex => something is messed up! <-- EPF: might as well break/return?
        }
    }
}

/* 1.5 Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2blc5a3. If the "compressed" string would not become smaller than the orig- inal string, your method should return the original string.
 
 Note: There are some strings which are indistinguishable from other strings un/compressed formats. E.g. a1b1c1 cannot be compressed and would equal a1b1c1, but when looking at a1b1c1, how do you know that you're looking at an uncompressed string? It's certainly possible that this is merely abc compressed.
 */

+ (NSString*) compress:(NSString*)input {
    //EPF: if (input.length > 0) { do the rest, if-length check } return input
    if (!input || input.length == 0) {
        return input;
    }
    
    NSMutableString *compressed = [NSMutableString string];
    unichar c = [input characterAtIndex:0];
    NSUInteger count = 1;
    
    for (NSInteger i=1; i<input.length; i++) {
        unichar d = [input characterAtIndex:i];
        
        if (c==d) {
            if (count == 9) {
                [compressed appendFormat:@"%c%lu", c, count];
                count = 0;
            }
            count++;
        } else {
            [compressed appendFormat:@"%c%lu", c, count];
            c = d;
            count = 1;
        }
    }
    
    [compressed appendFormat:@"%c%lu", c, count];
    
    if (compressed.length < input.length) {
        return compressed.copy;
    }
    
    return input;
}


@end
