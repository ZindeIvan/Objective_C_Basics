//
//  BirdFlock.h
//  Lesson-5
//
//  Created by Зинде Иван on 12/23/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Bird;

@interface BirdFlock : NSObject

@property (nonatomic, copy) NSArray<Bird *> *birds;

- (void)composeWithBirds:(NSArray<Bird *> *)birds;

@end
