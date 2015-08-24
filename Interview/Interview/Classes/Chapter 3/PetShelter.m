//
//  PetShelter.m
//  Interview
//
//  Created by Shawn Webster on 15/08/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "PetShelter.h"
#import "Node.h"
#import "Pet.h"
#import "Dog.h"
#import "Cat.h"

@interface PetShelter()

@property (strong, nonatomic) Pet *nextPet;
@property (weak, nonatomic) Pet *lastPet;

//dequeue the first pet of this Pet subclass
- (Pet*) _ps_dequeuePet:(Class)class;

@end

@implementation PetShelter

- (void) enqueue:(Pet*)pet {
    
    if (!self.nextPet) {
        self.nextPet = pet;
    } else {
        self.lastPet.next = pet;
    }
    
    self.lastPet = pet;
}

- (Pet*) dequeueAny {
    Pet *p = self.nextPet;
    self.nextPet = (Pet*)p.next;

    return p;
}

- (Dog*) dequeueDog {
    return (Dog*)[self _ps_dequeuePet:[Dog class]];
}

- (Cat*) dequeueCat {
    return (Cat*)[self _ps_dequeuePet:[Cat class]];
}

- (Pet*) _ps_dequeuePet:(Class)class {
    if ([self.nextPet isKindOfClass:class]) {
        return (Pet*)[self dequeueAny];
    }
    
    Pet *p = self.nextPet;
    
    while (p && ![p.next isKindOfClass:class]) {
        p = (Pet*)p.next;
    }
    
    if (p.next) {
        Pet *rp = (Pet*)p.next;
        p.next = p.next.next;
        rp.next = nil;
        p = rp;
    }
    
    return p;
}

- (NSString*) description {
    NSMutableString *d = [NSMutableString stringWithString:@"["];
    
    Pet *p = self.nextPet;
    
    while (p) {
        [d appendFormat:@" %@", p.data];
        
        if (p.next) {
            [d appendString:@","];
        }
        
        p = (Pet*)p.next;
    }
    
    [d appendString:@" ]"];
    
    return d.copy;
}

@end
