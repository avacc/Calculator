//
//  ExpressionCell.h
//  Calculator
//
//  Created by Alex Vaccarino on 3/15/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ExpressionCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField* oldExpression;

- (id) initWithStyle: (UITableViewCellStyle) style reuseIdentifier: (NSString*) reuseIdentifier withExpression: (NSString*) expression;

@end
