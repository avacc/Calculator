//
//  AGVViewController.h
//  Calculator
//
//  Created by Alex on 1/22/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"
#import "ExpressionCell.h"



@interface AGVViewController : UIViewController <UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView* solvedExpressions;
@property (strong, nonatomic) IBOutlet UITextField* expression;
@property (strong, nonatomic) NSMutableArray* oldExpressions;
@property (strong, nonatomic) Calculator* calculator;

- (IBAction) numberPress: (id) sender;
- (IBAction) operationPress: (id) sender;
- (IBAction) solvePress: (id) sender;
- (IBAction) backSpacePress: (id) sender;
@end
