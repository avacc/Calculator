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
NSString* mul = @"x";
NSString* d = @"/";

- (Calculator*) initCalculator {
    self = [super init];
    if(self){
        self.numberStack = [self.numberStack initStack];
        self.operatorStack = [self.operatorStack initStack];
    }
    return self;
}

- (NSString*) calculate: (NSString*) expression {
    if(![self ableToCalculate]){
        return nil;
    }
    
    NSDecimalNumber* result = 0;
    NSDecimalNumber* x;
    NSDecimalNumber* y;
    
    NSString* oper;
    while([self.operatorStack size] > 0){
        x = (NSDecimalNumber*) [self.numberStack pop];
        y = (NSDecimalNumber*) [self.numberStack pop];
        oper = (NSString*) [self.operatorStack pop];
        
        if([oper isEqualToString: add]){
            result = [x decimalNumberByAdding: y];
        }else if ([oper isEqualToString: sub]){
            result = [x decimalNumberBySubtracting: y];
        }else if ([oper isEqualToString:mul]){
            result = [x decimalNumberByMultiplyingBy: y];
        }else{
            result = [x decimalNumberByDividingBy: y];
        }
        [self.numberStack push: result];
    }
    result = (NSDecimalNumber*)[self.numberStack pop];
    return result.stringValue;
}



- (void) pushNumber: (NSString*) num {
    [self.numberStack push: num];
}

- (void) pushOperator: (NSString*) oper {
    [self.operatorStack push: oper];
}

- (BOOL) ableToCalculate {
    if(![self.numberStack isEmpty] && ![self.numberStack isEmpty]){
        if( ([self.numberStack size] - [self.operatorStack size]) != 1) {
            return false;
        }
        return true;
    }
    return false;
}

@end
