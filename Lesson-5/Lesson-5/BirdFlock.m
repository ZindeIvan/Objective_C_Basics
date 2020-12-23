//
//  BirdFloc.m
//  Lesson-5
//
//  Created by Зинде Иван on 12/23/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import "BirdFlock.h"
#import "Bird.h"

@implementation BirdFlock

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"Create bird flock");
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Dealloc bird flock");
    self.birds = nil;
    [super dealloc];
}

- (void)composeWithBirds:(NSArray<Bird *> *)birds {

    NSArray *copy = [birds copy];
    [_birds release];
    _birds = copy;
    for (Bird *bird in _birds) {
        NSLog(@"Add bird : %@, with wingspawn : %@ to the flock", bird.speciesName, bird.wingspawn);
    }
}

@end
