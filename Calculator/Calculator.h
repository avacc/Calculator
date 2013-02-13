//
//  Calculator.h
//  Calculator
//
//  Created by Alex on 2/13/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stack.h"

@interface Calculator : NSObject
@property (weak, nonatomic) Stack* numberStack;
@property (weak, nonatomic) Stack* operatorStack;

- (Calculator*) initCalculator;
- (id) calculate;
- (void) pushNumber: (id) num;
- (void) pushOperator: (id) oper;
- (BOOL) ableToCalculate;

@end
