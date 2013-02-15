//
//  AGVViewController.h
//  Calculator
//
//  Created by Alex on 1/22/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"
#import "Stack.h"

@interface AGVViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel* title;
@property (weak, nonatomic) IBOutlet UIScrollView* old;
@property (weak, nonatomic) IBOutlet UIScrollView* oper;

- (IBAction)numberPress:(id)sender;
- (IBAction)operationPress:(id)sender;
- (IBAction)solvePress:(id)sender;

@end
