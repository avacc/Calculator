//
//  Stack.h
//  Calculator
//
//  Created by Alex on 2/13/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject
@property (strong, nonatomic) NSMutableArray* stac;

- (Stack*) initStack;
- (BOOL) isEmpty;
- (void) push: (id) item;
- (id) pop;
- (id) peek;
- (NSUInteger) size;

@end
