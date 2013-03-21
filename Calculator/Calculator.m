//
//  Calculator.m
//  Calculator
//
//  Created by Alex on 2/13/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

NSString* add = @"+";
NSString* sub = @"-";
NSString* mul = @"*";
NSString* d = @"/";
NSString* ex = @"^";
NSString* mod = @"%";
NSArray* operators;


- (Calculator*) initCalculator {
    self = (Calculator*)[super init];
    if(self){
        NSLog(@"Made it");
        self.numberStack = [[Stack alloc] initStack];
        self.operatorStack = [[Stack alloc] initStack];
    }
    
    operators = [[NSArray alloc] initWithObjects: add, sub, mul, d, ex, mod, nil];
    return self;
}

- (NSString*) calculate: (NSString*) expression {
    NSArray* tokens = [expression componentsSeparatedByCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
    NSDecimalNumber* second = [[NSDecimalNumber alloc] init];
    NSDecimalNumber* first = [[NSDecimalNumber alloc] init];
    NSDecimalNumber* result = [[NSDecimalNumber alloc] init];
    for(NSString* token in tokens){
        NSLog(@"Number Stack size: %d", self.numberStack.stac.count);
        if([operators containsObject: token]){
            NSLog(@"Contains object");
            if([self isHigherPriority: token]) {
                [self.operatorStack push: token];
                NSLog(@"Operator Stack Size: %d", self.operatorStack.stac.count);
            }else{
                NSLog(@"isHigherPriority: %@", ([self isHigherPriority: token]) ? @"YES" : @"NO");
                NSString* operator = (NSString*) [self.operatorStack pop];
                second = [NSDecimalNumber decimalNumberWithString: (NSString*)[self.numberStack pop]];
                first = [NSDecimalNumber decimalNumberWithString: (NSString*)[self.numberStack pop]];
                if([operator isEqualToString: ex]){
                    result = [first decimalNumberByRaisingToPower: [second integerValue]];
                }else if([operator isEqualToString: mul]){
                    result = [first decimalNumberByMultiplyingBy: second];
                }else if([operator isEqualToString: d]){
                    result = [first decimalNumberByDividingBy: second];
                }else if([operator isEqualToString: mod]){
                    int x = [first intValue];
                    int y = [second intValue];
                    int* ans = x%y;
                    result = (NSDecimalNumber*)[NSDecimalNumber numberWithInt: ans];
                }else if([operator isEqualToString: add]){
                    result = [first decimalNumberByAdding: second];
                }else{
                    result = [first decimalNumberBySubtracting: second];
                }
                [self.numberStack push: result];
                [self.operatorStack push: token];
            }
        }else{
            [self.numberStack push: token];
        }
    }
    NSString* op;
    NSDecimalNumber* x;
    NSDecimalNumber* y;
    NSDecimalNumber* solved;
    while(![self.operatorStack isEmpty]){
        NSLog(@"2nd Loop - numberStack size: %d", self.numberStack.stac.count);
        NSLog(@"2nd Loop - operatorStack size: %d", self.operatorStack.stac.count);
        op = (NSString*)[self.operatorStack pop];
        NSLog(@"%@", op);
        if([[self.numberStack peek] isKindOfClass: [NSString class]]){
            y = [NSDecimalNumber decimalNumberWithString: (NSString*) [self.numberStack pop]];
        }else{
            y = [self.numberStack pop];
        }
        if([[self.numberStack peek] isKindOfClass: [NSString class]]){
            x = [NSDecimalNumber decimalNumberWithString: (NSString*) [self.numberStack pop]];
        }else{
            x = [self.numberStack pop];
        }
        NSLog(@"x: %@", x);
        NSLog(@"y: %@", y);
        if([op isEqualToString: ex]){
        solved = [x decimalNumberByRaisingToPower: [y integerValue]];
        }else if([op isEqualToString: mul]){
            solved = [x decimalNumberByMultiplyingBy: y];
        }else if([op isEqualToString: d]){
            solved = [x decimalNumberByDividingBy: y];
        }else if([op isEqualToString: mod]){
            int xx = [x intValue];
            int yy = [y intValue];
            int ans = xx%yy;
            solved = (NSDecimalNumber*)[NSDecimalNumber numberWithInt: ans];
        }else if([op isEqualToString: add]){
            solved = [x decimalNumberByAdding: y];
        }else{
            solved = [x decimalNumberBySubtracting: y];
        }
        [self.numberStack push: solved];
    }
    NSDecimalNumber* z = (NSDecimalNumber*)[self.numberStack pop];
    NSString* toBeReturned = [z stringValue];
    return toBeReturned;
}
                    
- (BOOL) isHigherPriority: (NSString*) newOperator{
    if([self.operatorStack isEmpty]){
        return YES;
    }
    NSString* topOperator = (NSString*)[self.operatorStack peek];
    if([topOperator isEqualToString: newOperator]){
        return YES;
    }else if([topOperator isEqualToString: ex]){
        return NO;
    }else if([topOperator isEqualToString: mul] || ([topOperator isEqualToString: d] || [topOperator isEqualToString: mod])){
        if([newOperator isEqualToString: ex]){
            return YES;
        }else if([newOperator isEqualToString: mul] || ([newOperator isEqualToString: d] || [newOperator isEqualToString: mod])){
            return YES;
        }else{
            return NO;
        }
    }else{
        return YES;
    }
                        
}


@end
