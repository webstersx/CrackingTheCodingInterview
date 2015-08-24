//
//  TwoStackQueue.h
//  Interview
//
//  Created by Shawn Webster on 14/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoStackQueue : NSObject

- (void) enqueue:(id)data;
- (id) dequeue;
- (id) peek;
- (BOOL) isEmpty;

@end
