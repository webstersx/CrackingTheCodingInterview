//
//  PetShelter.h
//  Interview
//
//  Created by Shawn Webster on 15/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Pet, Dog, Cat;

@interface PetShelter : NSObject

- (void) enqueue:(Pet*)pet;
- (Pet*) dequeueAny;
- (Dog*) dequeueDog;
- (Cat*) dequeueCat;

@end
