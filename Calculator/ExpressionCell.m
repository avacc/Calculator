//
//  ExpressionCell.m
//  Calculator
//
//  Created by Alex Vaccarino on 3/15/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "ExpressionCell.h"

@implementation ExpressionCell
- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withExpression: (NSString*) expression {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if(self){
        self.oldExpression = [[UITextField alloc] init];
        self.oldExpression.text = expression;
    }
    return self;
}
@end