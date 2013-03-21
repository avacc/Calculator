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

- (id) init {
    self = [super init];
    if(self){
    }
    self.calculator = [[Calculator alloc] initCalculator];
    self.solvedController = [[UITableViewController alloc] init];
    self.solvedExpressions = [[UITableView alloc] init];
    [self.solvedController setTableView: self.solvedExpressions];
    [self.view addSubview: self.solvedExpressions];
    
    
    self.oldExpressions = [[NSMutableArray alloc] init];
    self.solvedExpressions.delegate = self;
    self.solvedExpressions.dataSource = self;
    NSLog(@"View controller initialized");
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self init];
    NSLog(@"View loaded");
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
        
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow: [self.oldExpressions count] inSection: 0];
        [self.oldExpressions addObject: answer];
        NSLog(@"%d", self.oldExpressions.count);
        NSArray* array = [[NSArray alloc] initWithObjects: indexPath, nil];
        [self.solvedExpressions insertRowsAtIndexPaths: array withRowAnimation: UITableViewRowAnimationAutomatic];
        NSString* completeExpression = [self.expression.text stringByAppendingFormat: @" = %@", answer];
        ExpressionCell* cell = (ExpressionCell*)[self.solvedExpressions.dataSource tableView: self.solvedExpressions cellForRowAtIndexPath:indexPath];
        NSLog(@"%@", cell);
        
        //cell.oldExpression.text = completeExpression;
        NSLog(@"completeExpression: %@ cell.oldExpression.text: %@", completeExpression, cell.oldExpression.text);
        self.expression.text = @"";
        [self.solvedExpressions reloadData];
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

#pragma mark - UITableViewDataSource methods
- (UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath*) indexPath {
    ExpressionCell* cell = (ExpressionCell*)[self.solvedExpressions dequeueReusableCellWithIdentifier: @"ExpressionCell"];
    NSLog(@"%@", cell);
    if(!cell){
        cell = (ExpressionCell*)[[ExpressionCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"ExpressionCell" withExpression: @"text"];
    }
    
    return cell;
}

- (NSInteger) tableView: (UIView*) tableView numberOfRowsInSection: (NSInteger) section {
    return [self.oldExpressions count];
}

- (NSInteger) numberOfSectionsInTableView: (UITableView*) tableView{
    return 1;
}
@end
