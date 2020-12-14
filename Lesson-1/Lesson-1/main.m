//
//  main.m
//  Lesson-1
//
//  Created by Зинде Иван on 12/14/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    //MARK: -First Task-
    int first = 0;
    int second = 0;
    printf("----------- First task -----------\n");
    printf("First number: ");
    scanf("%d", &first);
    printf("Second number: ");
    scanf("%d", &second);
    printf("First + Second: ");
    printf("%d\n", first + second);
    printf("First - Second: ");
    printf("%d\n", first - second);
    printf("First * Second: ");
    printf("%d\n", first * second);
    printf("First / Second: ");
    printf("%d\n",  second == 0 ? 0 : first / second );
    printf("\n");
    first = 0;
    second = 0;
    
    //MARK: -Second Task-
    printf("----------- Second task -----------\n");
    printf("First number: ");
    scanf("%d", &first);
    printf("Second number: ");
    scanf("%d", &second);
    printf("First + Second = %i; First - Second = %i; First * Second = %i; First / Second = %i\n",
           first + second,
           first - second,
           first * second,
           second == 0 ? 0 : first / second);
    printf("\n");
    first = 0;
    second = 0;
    
    //MARK: -Third Task-
    //Если какие то из чисел равны выберем первое число по порядку
    int third = 0;
    printf("----------- Third task -----------\n");
    printf("First number: ");
    scanf("%d", &first);
    printf("Second number: ");
    scanf("%d", &second);
    printf("Third number: ");
    scanf("%d", &third);
    
    if (first >= second && first <= third) {
        printf("Average number is first number: %i\n", first);
    } else if (second >= first && second <= third) {
        printf("Average number is second number: %i\n", second);
    } else {
        printf("Average number is third number: %i\n", third);
    }
    
    return 0;
}
