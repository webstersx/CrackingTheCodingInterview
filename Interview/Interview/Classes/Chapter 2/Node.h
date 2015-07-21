//
//  Node.h
//  Interview
//
//  Created by Shawn Webster on 21/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (strong, nonatomic) id data;
@property (strong, nonatomic) Node *next;

- (instancetype) initWithData:(id)data;

@end
