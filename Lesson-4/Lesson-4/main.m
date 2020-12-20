//
//  main.m
//  Lesson-4
//
//  Created by Зинде Иван on 12/20/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {

    Student *Bob = [[Student alloc] initWithName:@"Bob" surname:@"Smith" age:18];
    Student *Lily = [[Student alloc] initWithName:@"Lily" surname:@"Black" age:19];
    Student *Alan = [[Student alloc] initWithName:@"Alan" surname:@"Small" age:17];
    
    printf("Students list:\n\n");
    printf("%s\n\n", [Bob.description UTF8String]);
    printf("%s\n\n", [Lily.description UTF8String]);
    printf("%s\n\n", [Alan.description UTF8String]);
    
    [Bob increaseAge:2];
    [Lily increaseAge:1];
    [Alan increaseAge:3];
    
    printf("\n");
    printf("----------------------\n");
    printf("Students list:\n\n");
    printf("%s\n\n", [Bob.description UTF8String]);
    printf("%s\n\n", [Lily.description UTF8String]);
    printf("%s\n\n", [Alan.description UTF8String]);
    
    return 0;
}
