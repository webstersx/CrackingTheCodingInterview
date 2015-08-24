//
//  Queue.h
//  Interview
//
//  Created by Shawn Webster on 16/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject


- (void) enqueue:(id)data;
- (id) dequeue;
- (id) peek;
- (BOOL) isEmpty;

@end
