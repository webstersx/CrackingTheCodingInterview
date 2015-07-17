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

/* 1.6 Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
 
    1 => 1
 
    1 2  => 3 1
    3 4     4 2

    tmp = 0,n-1
    0,0 => 0,n-1
    
    tmp = n-1, n-1
    0,n-1 => n-1, n-1
 
    tmp = n-1, 0
    n-1, n-1 => n-1, 0
 
    tmp = NULL
    n-1, 0 => 0,0
 
    1 2 3  => 7 4 1  => 7 4 1
    4 5 6     8 5 2     8   2 + 5
    7 8 9     9 6 3     9 6 3
 
    a b c d => m i e a
    e f g h    n     b   +  j f
    i j k l    o     c      k g
    m n o p    p l h d
 
 
    a b c | d e => m n | o p a
    p q r | s f    l w | x q b
    o x y | t g    k v | y r c
    -------            -------
    n w v   u h    j u   t s d
    m l k   j i    i h   g f e
 
    if you take ceil(0.5 * n) and rotate that around , you'll end up rotating the whole thing
 
    alternately, if you rotate the outside, then go in +1, -1 on both ends, and rotate the inside until size is 1 or 0
 
 
 // 1 2 3    1   3    hold onto 1,
 // 4 5 6             place 7 where 1 is (n,0) => (0,0)
 // 7 8 9    7   9    place 9 where 7 was (n,n) => (0,n)
 //                   place 3 where 9 was (0,n) => (n,n)
 //                   place 1 where 3 was (temp) => (0,n)
 //                   take 0 as left, n+1 as right? i-i = 0, n+1-i?

 focus on 1,3,7,9         7    3
 place 1 into temp                    7    3
 place 7 where 1 is ----> 7    9                   7    3
 place 9 where 7 was ---------------> 9    9                   7    1
 place 3 where 9 was ----------------------------> 9    3
 place temp where 3 was -------------------------------------> 9    3
 
 increase i, work out the rest after, but so far we should have:
 row = 0, col = 1
 left = 0, right = 1
 m = right+1 or n-1, = 0-indexed width/height of matrix
 7 2 1  (0,1) = temp,       (1,0)=>(0,1),      (2,1)=>(1,0),    (1,1)=>(2,1),   (temp)=>(1,1)
 4 5 6  (row,col) = temp    (m-col,row)=> <--  (m, m-col)=> <-- (col, m)=> <--  (temp)=> <--
 9 8 3

 Note: some information is missing from these comments for how I solved, but it became the most obvious when I moved to a 6x6 matrix
 I solved 1x1, 2x2, 3x3 matrixes on my first iteration, but as soon as it had work to do when moving inward I found my solution wasn't
 correct. Because the inner 2x2 matrix has row/cols of 1/1, 1/2, 2/1, 2/2, I found it more difficult to debug than when I was dealing with say,
 the 6x6 where on the second step it will be, =>r1c1=>r1c4=>r4c4=>r1c4 then move to r1c2=>r2c4=>r4c3=>r3c1

 */

+ (void) rotate:(int**)matrix n:(int)n {
    NSLog(@"before:");
    [self logMatrix:matrix n:n];
    
    //basically we only need to cover a sub-matrix of ceil(half the height)
    for (int row = 0; row < (n+1)/2; row++) {
        
        //lets us move smaller inner matrices ( at row 1, we're moving positons 1 through n-1, at row 2, 2 through n-2
        for (int col = row; col <= n-2-row; col++) {
            
            //NOTE: read the numbers below as a clock face
            //go anti-clockwise/counter-clockwise so we only need 1 temp value
        
            //capture the first value
            int temp = matrix[row][col];
            
            //place 9 at 12
            matrix[row][col] = matrix[n-1-col][row];
            
            //place 6 at 9
            matrix[n-1-col][row] = matrix[n-1-row][n-1-col];
            
            //place 3 at 6
            matrix[n-1-row][n-1-col] = matrix[col][n-1-row];
            
            //place temp (was at 12) at 3
            matrix[col][n-1-row] = temp;
        }
    }
    
    NSLog(@"after:");
    [self logMatrix:matrix n:n];
}

+ (void) logMatrix:(int**)matrix n:(int)n {
    NSMutableString *m = [NSMutableString string];
    for (int i=0; i<n; i++) {
        [m appendString:@"\n"];
        for (int j=0; j<n; j++) {
            [m appendFormat:@"%d ", matrix[i][j]];
        }
    }
    NSLog(@"%@", m);
}


@end
