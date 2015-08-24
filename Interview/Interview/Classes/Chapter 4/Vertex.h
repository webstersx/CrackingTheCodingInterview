//
//  Vertex.h
//  Interview
//
//  Created by Shawn Webster on 15/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vertex : NSObject

@property (readonly, nonatomic) id<NSCopying> key;
@property (strong, nonatomic) id object;
@property (strong, nonatomic) NSPointerArray *edges;

+ (Vertex*) vertexWithKey:(id<NSCoding>)key object:(id)object;

@end
