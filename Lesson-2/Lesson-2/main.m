//
//  main.m
//  Lesson-2
//
//  Created by Зинде Иван on 12/14/20.
//  Copyright © 2020 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL isInEngAlphabet (char character) {
    return (character >= 65 && character <= 90) || (character >= 97 && character <= 122);
}

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

int calculate(NSString *method, int a, int b) {
   
    if ([method isEqualToString:@"+"]) {
        return addition(a, b);
    }
    else if ([method isEqualToString:@"-"]) {
        return subtraction(a, b);
    }
    else if ([method isEqualToString:@"*"]) {
        return multiplication(a, b);
    }
    else if ([method isEqualToString:@"/"]) {
        return divivsion(a, b);
    }
    else if ([method isEqualToString:@"%"]) {
        return remainderOfDivivsion(a, b);
    }
    else {
        printf("Invalid math operation\n");
        return 0;
    }

}

int main(int argc, const char * argv[]) {
    
    //MARK: -First Task-
    char character = 32;
    printf("----------- First task -----------\n");
    printf("Enter character: ");
    scanf("%s", &character);
    
    if (isInEngAlphabet(character)) {
        printf("Character '%s' belongs to the English alphabet\n", &character);
    } else {
        printf("Character '%s' does not belongs to English alphabet\n", &character);
    }
    printf("\n");
    
    //MARK: -Second Task-
    printf("----------- Second task -----------\n");
    int first = 0;
    int second = 0;
    character = '+';
    printf("First number: ");
    scanf("%d", &first);
    printf("Second number: ");
    scanf("%d", &second);
    printf("Math operation: ");
    scanf("%s", &character);
    printf("Result: %i\n", calculate([NSString stringWithFormat:@"%c", character], first, second));

    return 0;
}
