//
//  main.m
//  Lesson-5
//
//  Created by Зинде Иван on 12/23/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"
#import "BirdFlock.h"
#import "Bird.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        //    //MARK: -First Task-
        NSLog(@"----------- First task -----------");

        Calculator *calc = [[Calculator alloc] initWithMathOperation:@"+" leftNumber:@1 rightNumber:@2];
        NSLog(@"Result : %d", calc.calculate);
        
        Calculator *calc1 = [[Calculator alloc] initWithMathOperation:@"-" leftNumber:@7 rightNumber:@12];
        NSLog(@"Result : %d", calc1.calculate);
        
        Calculator *calc2 = [[Calculator alloc] initWithMathOperation:@"*" leftNumber:@2 rightNumber:@32];
        NSLog(@"Result : %d", calc2.calculate);
        
        Calculator *calc3 = [[Calculator alloc] initWithMathOperation:@"/" leftNumber:@5 rightNumber:@2];
        NSLog(@"Result : %d", calc3.calculate);
        
        Calculator *calc4 = [[Calculator alloc] initWithMathOperation:@"%" leftNumber:@4 rightNumber:@3];
        NSLog(@"Result : %d", calc4.calculate);
        
        [calc release];
        [calc1 release];
        [calc2 release];
        [calc3 release];
        [calc4 release];
        NSLog(@"");
        
        //    //MARK: -Second Task-
        NSLog(@"----------- Second task -----------");
        
        BirdFlock *flock = [[BirdFlock alloc] init];
        
        Bird *bird1 = [[Bird alloc] initWithSpeciesName:@"Mallard Duck" andWingspawn:@95];
        Bird *bird2 = [[Bird alloc] initWithSpeciesName:@"Mute Swan" andWingspawn:@200];
        Bird *bird3 = [[Bird alloc] initWithSpeciesName:@"Snow Goose" andWingspawn:@140];
        
        NSArray *birds = [[NSArray alloc ] initWithObjects:bird1, bird2, bird3, nil];
        [bird1 release];
        [bird2 release];
        [bird3 release];
        
        [flock composeWithBirds:birds];
        [birds release];
        NSLog(@"Flock of birds is composed");
        
        [flock release];
        
    }
    return 0;
}
