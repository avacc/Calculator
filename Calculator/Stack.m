//
//  Stack.m
//  Calculator
//
//  Created by Alex on 2/13/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "Stack.h"

@implementation Stack

- (Stack*) initStack {
    self = [super init];
    if (self){
        self.stac = [[NSMutableArray alloc] initWithCapacity: 100];
    }
    return self;
}

- (BOOL) isEmpty {
    if(self.stac.count == 0){
        return true;
    }
    return false;
}

- (void) push: (id)item {
    [self.stac addObject: item];
}

- (id) pop {
    if(self.isEmpty){
        return nil;
    }
    id popped = [self.stac lastObject];
    [self.stac removeLastObject];
    return popped;
}

- (id) peek {
    if(self.isEmpty){
        return nil;
    }
    return [self.stac lastObject];
}

- (NSUInteger) size {
    return [self.stac count];
}

@end
