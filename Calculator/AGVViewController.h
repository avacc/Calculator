//
//  AGVViewController.h
//  Calculator
//
//  Created by Alex on 1/22/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExpressionCell.h"
#import "Calculator.h"
#import "Stack.h"

@interface AGVViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView* solvedExpressions;
@property (strong, nonatomic) IBOutlet UITextField* expression;
@property (strong, nonatomic) Calculator* calculator;
@property (strong, nonatomic) NSMutableArray* oldExpressions;


- (IBAction) numberPress: (id) sender;
- (IBAction) operationPress: (id) sender;
- (IBAction) solvePress: (id) sender;
- (IBAction) backSpacePress: (id) sender;

@end
