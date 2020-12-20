//
//  Student.h
//  Lesson-4
//
//  Created by Зинде Иван on 12/20/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;

@property (nonatomic, readonly) NSInteger age;
@property (nonatomic, readonly) NSString *fullName;

-(instancetype) initWithName: (NSString *)name surname:(NSString *)surname age:(NSInteger)age;
-(void)increaseAge:(NSInteger)age;

@end

NS_ASSUME_NONNULL_END
