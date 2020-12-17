//
//  main.m
//  Lesson-3
//
//  Created by Зинде Иван on 12/17/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>

enum MathOperation {
    Addition = '+',
    Subtraction = '-',
    Multiplication = '*',
    Divivsion = '/',
    RemainderOfDivivsion = '%'
};
typedef int MathOperation;


int addition(int a, int b) {
    return a + b;
}

int subtraction(int a, int b) {
    return a - b;
}

int multiplication(int a, int b) {
    return a * b;
}

int divivsion(int a, int b) {
    return b == 0 ? 0 : a / b;
}

int remainderOfDivivsion(int a, int b) {
    return a % b;
}

int calculate(MathOperation mathOperation, int a, int b) {

    switch (mathOperation) {
        case Addition :
            return addition(a, b);
        case Subtraction :
            return subtraction(a, b);
        case Multiplication :
            return multiplication(a, b);
        case Divivsion :
            return divivsion(a, b);
        case RemainderOfDivivsion :
            return remainderOfDivivsion(a, b);
        default:
            printf("Invalid math operation\n");
            return 0;
    }
}

enum Gender {
    Female = 0,
    Male = 1
};
typedef int Gender;

struct Human {
    __unsafe_unretained NSString *name;
    NSInteger age;
    Gender gender;
};

typedef struct Human Human;


void printHuman(Human human){
    printf("Human: \n name %s,\n age %ld,\n gender %s\n",
            [human.name UTF8String],
           (long)human.age,
            human.gender == 0 ? "female" : "male");
    printf("\n");
}

int main(int argc, const char * argv[]) {
    
//    //MARK: -First Task-
    printf("----------- First task -----------\n");
    char input[1000] = {};
    printf("Enter strings with spaces:");
    scanf("%[^\n]%*c", input);
    NSString *inputString = [NSString stringWithCString:input encoding:NSUTF8StringEncoding];
    NSArray *stringsArray = [inputString componentsSeparatedByString:@" "];
    printf("\n");
    printf("Strings array elements:\n");
    for (NSString *aString in stringsArray) {
        printf("%s\n", [aString UTF8String]);
    }
    printf("\n");
    
    //MARK: -Second Task-
    printf("----------- Second task -----------\n");
    char character = 32;
    int first = 0;
    int second = 0;
    character = '+';
    printf("First number: ");
    scanf("%d", &first);
    printf("Second number: ");
    scanf("%d", &second);
    printf("Math operation: ");
    scanf("%s", &character);
    printf("Result: %i\n", calculate((int)character, first, second));
    printf("\n");
    
    //MARK: -Third Task-
    printf("----------- Third task -----------\n");
    
    Human Jake, Lisa, Jhon;
    
    Jake.age = 18;
    Jake.gender = Male;
    Jake.name = @"Jake";
    
    Lisa.age = 32;
    Lisa.gender = Female;
    Lisa.name = @"Lisa";
    
    Jhon.age = 43;
    Jhon.gender = Male;
    Jhon.name = @"Jhon";

    printHuman(Jake);
    printHuman(Lisa);
    printHuman(Jhon);
    
    return 0;
}
