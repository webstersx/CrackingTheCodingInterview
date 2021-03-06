//
//  Stack.h
//  Interview
//
//  Created by Shawn Webster on 14/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

- (void) push:(id)data;
- (id) pop;
- (id) peek;
- (BOOL) isEmpty;

@end
