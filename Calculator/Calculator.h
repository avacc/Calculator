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
@property (strong, nonatomic) Stack* numberStack;
@property (strong, nonatomic) Stack* operatorStack;


- (Calculator*) initCalculator;
- (NSString*) calculate: (NSString*) expression;
- (void) pushNumber: (id) num;
- (void) pushOperator: (id) oper;
- (BOOL) ableToCalculate;

@end
