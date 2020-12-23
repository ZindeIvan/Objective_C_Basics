//
//  Calculator.h
//  Lesson-5
//
//  Created by Зинде Иван on 12/23/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (nonatomic, readonly, strong) NSNumber *leftNumber;
@property (nonatomic, readonly, strong) NSNumber *rightNumber;
@property (nonatomic, copy) NSString *mathOperation;

- (instancetype)initWithMathOperation:(NSString *)mathOperation leftNumber:(NSNumber *)leftNumber rightNumber:(NSNumber *)rightNumber;
- (int)calculate;

@end
