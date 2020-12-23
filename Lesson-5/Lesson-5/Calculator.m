//
//  Calculator.m
//  Lesson-5
//
//  Created by Зинде Иван on 12/23/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

- (instancetype)initWithMathOperation:(NSString *)mathOperation leftNumber:(NSNumber *)leftNumber rightNumber:(NSNumber *)rightNumber {
    if (self = [super init]) {
        _mathOperation = [mathOperation copy];
        _leftNumber = [leftNumber retain];
        _rightNumber = [rightNumber retain];
        NSLog(@"Math operation :  %@  %@  %@ ", _leftNumber, _mathOperation, _rightNumber);
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Dealloc math operation :  %@  %@  %@ ", _leftNumber, _mathOperation, _rightNumber);
    self.mathOperation = nil;
    [_leftNumber release ];
    [_rightNumber release ];
    [super dealloc];
}

- (int)calculate {
    
    if ([_mathOperation length] == 0) {
        printf("Invalid math operation\n");
        return 0;
    }
    
    switch ([_mathOperation characterAtIndex:0]) {
        case '+' :
            return [_leftNumber intValue] + [_rightNumber intValue];
        case '-' :
            return [_leftNumber intValue] - [_rightNumber intValue];
        case '*' :
            return [_leftNumber intValue] * [_rightNumber intValue];
        case '/' : 
            return [_rightNumber intValue] == 0 ? 0 : [_leftNumber intValue] / [_rightNumber intValue];
        case '%' :
            return [_leftNumber intValue] % [_rightNumber intValue];
        default  :
            printf("Invalid math operation\n");
            return 0;
    }
}

@end
