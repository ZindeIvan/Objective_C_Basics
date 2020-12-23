//
//  Bird.m
//  Lesson-5
//
//  Created by Зинде Иван on 12/23/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import "Bird.h"

@implementation Bird

- (instancetype)initWithSpeciesName:(NSString *)speciesName andWingspawn:(NSNumber *)wingspawn {
    if (self = [super init]) {
        _speciesName = [speciesName copy];
        _wingspawn = [wingspawn retain];
        NSLog(@"Create bird %@, wingspawn : %@", _speciesName, _wingspawn);
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Dealloc bird %@, wingspawn : %@", _speciesName, _wingspawn);
    self.speciesName = nil;
    [_wingspawn release ];
    [super dealloc];
}

@end
