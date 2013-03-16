//
//  AGVViewController.m
//  Calculator
//
//  Created by Alex on 1/22/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "AGVViewController.h"


@interface AGVViewController ()
    
@end

@implementation AGVViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.oldExpressions = [[NSMutableArray alloc] init];
    self.calculator = [[Calculator alloc] initCalculator];
}

- (IBAction) numberPress: (id) sender {
    UIButton* numberButton = (UIButton*) sender;
    NSString* number = numberButton.currentTitle;
    self.expression.text = [self.expression.text stringByAppendingString: number];
}

- (IBAction) operationPress: (id) sender {
    UIButton* operationButton = (UIButton*) sender;
    NSString* operator = operationButton.currentTitle;
    if([self.expression.text length] == 0 || [[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @" "]) {
    } else {
        NSString* addition = [[NSString alloc] initWithFormat: @" %@ ", operator];
        self.expression.text = [self.expression.text stringByAppendingString: addition];
    }
}

- (IBAction) solvePress: (id) sender {
    if([[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @" "]){
    }else{
        NSString* answer = [self.calculator calculate: self.expression.text];
        
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow: [self.solvedExpressions numberOfRowsInSection: 0] inSection: 0];
        [self.oldExpressions addObject: answer];
        NSArray* array = [[NSArray alloc] initWithObjects: indexPath, nil];
        [self.solvedExpressions insertRowsAtIndexPaths: array withRowAnimation: UITableViewRowAnimationAutomatic];
        ExpressionCell* cell = (ExpressionCell*) [self.solvedExpressions cellForRowAtIndexPath: indexPath];
        cell.oldExpression.text = answer;
        [self.solvedExpressions reloadData];
        self.expression.text = @"";
    }    
}

- (IBAction) backSpacePress: (id) sender {
    
    if([self.expression.text length] == 0) {
    }else if([[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @" "]){
        self.expression.text = [self.expression.text substringToIndex: [self.expression.text length]-3];
    }else{
        self.expression.text = [self.expression.text substringToIndex: [self.expression.text length]-1];
    }
}

#pragma mark - TableView methods
- (UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath*) indexPath {
    ExpressionCell* cell = (ExpressionCell*)[self.solvedExpressions dequeueReusableCellWithIdentifier: @"ExpressionCell"];
    
    if(!cell){
        cell = [[ExpressionCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"ExpressionCell"];
    }
    
    return cell;
}

- (NSInteger) tableView: (UITableView*) tableView numberOfRowsInSection: (NSInteger) section {
    return [self.oldExpressions count];
}
@end
