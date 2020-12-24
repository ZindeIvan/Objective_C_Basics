//
//  main.m
//  Lesson-6
//
//  Created by Зинде Иван on 12/24/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //MARK: -First Task-
        NSLog(@"----------- First task -----------");
        
        int (^sumBlock)(int, int)= ^(int a, int b){
            return a + b;
        };
        
        NSLog(@"");
        NSLog(@"Sum block 5 + 4 = %d", sumBlock(5,4));
        NSLog(@"");
        
        NSString *(^fullNameBlock)(NSString *, NSString *) = ^(NSString *firstName, NSString *lastName) {
            return [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        };
        
        NSLog(@"");
        NSLog(@"Full name block %@", fullNameBlock(@"Jhon",@"Smith"));
        NSLog(@"");
        
        void (^printStringBlock)(NSString *) = ^(NSString *stringToPrint) {
            NSLog(@"%@", stringToPrint);
        };
        
        NSLog(@"");
        printStringBlock(@"String to print block");
        NSLog(@"");
        
        void (^voidBlock)(void) = ^(void){
            NSLog(@"Void block");
        };
        
        NSLog(@"");
        voidBlock();
        NSLog(@"");
        
        NSDate *(^getDateBlock)(void) = ^(void) {
            return  [NSDate date];
        };
        
        void (^printDateBlock)(void) = ^(void){
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc ] init];
            dateFormatter.dateFormat = @"dd-MM-yyyy";
            NSString *dateString = [dateFormatter stringFromDate: getDateBlock()];
            NSLog(@"Print date block %@", dateString);
        };
        
        NSLog(@"");
        printDateBlock();
        NSLog(@"");
        
        //MARK: -Second Task-
        NSLog(@"----------- Second task -----------");
        
        dispatch_group_t group = dispatch_group_create();
        dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_UNSPECIFIED, 0);
        
        dispatch_group_async(group, queue, ^{
            printDateBlock();
        });
        dispatch_group_async(group, queue, ^{
            NSLog(@"Full name block %@", fullNameBlock(@"Bob",@"White"));
        });
        dispatch_group_async(group, queue, ^{
            NSLog(@"Sum block 13 + 25 = %d", sumBlock(13,25));
        });
        dispatch_group_async(group, queue, ^{
            printStringBlock(@"String from dispatch");
        });
        dispatch_group_async(group, queue, ^{
            voidBlock();
        });
        
        dispatch_group_notify(group, queue, ^{
            NSLog(@"All queue was finished");
        });
        
    }
    
    sleep(3);
    
    return 0;
}
