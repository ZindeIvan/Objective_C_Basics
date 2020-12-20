//
//  Student.m
//  Lesson-4
//
//  Created by Зинде Иван on 12/20/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import "Student.h"

@implementation Student

-(instancetype) initWithName: (NSString *)name surname:(NSString *)surname age:(NSInteger)age {
    
    self = [super init];
    if (self) {
        self.name = name;
        self.surname = surname;
        _age = age;
    }
    return self;
}

-(NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Student:\n Name: %@\n Surname: %@\n Full name: %@\n Age: %ld", self.name, self.surname, self.fullName, self.age];
}

-(void)increaseAge:(NSInteger)age {
    _age += age;
}

@end
