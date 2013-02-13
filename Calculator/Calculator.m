//
//  Calculator.m
//  Calculator
//
//  Created by Alex on 2/13/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
    
- (Calculator*) initCalculator {
    self = [super init];
    if(self){
        self.numberStack = [self.numberStack initStack];
        self.operatorStack = [self.operatorStack initStack];
    }
    return self;
}

- (id) calculate {
    if(![self ableToCalculate]){
        return nil;
    }
    
}

- (void) pushNumber: (id) num {
    [self.numberStack push: num];
}

- (void) pushOperator: (id) oper {
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
