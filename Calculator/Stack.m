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
    self = (Stack*)[super init];
    if (self){
        self.stac = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL) isEmpty {
    if(self.stac.count == 0){
        return YES;
    }
    return NO;
}

- (void) push: (id) item {
    [self.stac addObject: item];
    if([self isEmpty]){
        NSLog(@"Push failed");
    }else{
        NSLog(@"Stack size: %d", self.stac.count);
    }
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


@end
