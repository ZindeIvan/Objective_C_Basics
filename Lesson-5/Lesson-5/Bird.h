//
//  Bird.h
//  Lesson-5
//
//  Created by Зинде Иван on 12/23/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bird : NSObject

@property (nonatomic, copy) NSString *speciesName;
@property (nonatomic, readonly, strong) NSNumber *wingspawn;

- (instancetype)initWithSpeciesName:(NSString *)speciesName andWingspawn:(NSNumber *)wingspawn;

@end
