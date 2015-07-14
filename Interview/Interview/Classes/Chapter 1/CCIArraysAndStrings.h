//
//  CCIArraysAndStrings.h
//  Interview
//
//  Created by Shawn Webster on 9/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCIArraysAndStrings : NSObject

//1.1
+ (BOOL) hasAllUniqueCharacters:(NSString*)string;
+ (BOOL) hasAllUniqueCharactersO1Space:(NSString*)string;

//1.2
+ (NSString*) reverse:(NSString*)string;
void reverse(char * buffer);

//1.3
+ (BOOL) isString:(NSString*)string1 permutationOf:(NSString*)string2;

//1.4
+ (void) encodeSpaces:(NSMutableString*)string length:(NSInteger)n;

//1.5
+ (NSString*) compress:(NSString*)input;

@end
