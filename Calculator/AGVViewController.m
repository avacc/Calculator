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

BOOL hasDecimal = NO;
BOOL hasNegative = NO;

- (id) init {
    self = [super init];
    if(self){
    }
    self.calculator = [[Calculator alloc] initCalculator];
    //self.solvedExpressions = [[UITableView alloc] init];
    self.solvedExpressions.dataSource = self;
    
    self.oldExpressions = [[NSMutableArray alloc] init];

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
    if([numberButton.currentTitle isEqualToString: @"-(x)"]){
        if(!hasNegative){
            self.expression.text = [self.expression.text stringByAppendingString: @"-"];
            hasNegative = YES;
        }
    }else if([numberButton.currentTitle isEqualToString: @"."]){
        if(!hasDecimal){
            self.expression.text = [self.expression.text stringByAppendingString: @"."];
            hasDecimal = YES;
        }
    }else{
        NSString* number = numberButton.currentTitle;
        self.expression.text = [self.expression.text stringByAppendingString: number];
        hasNegative = YES;
    }
}

- (IBAction) operationPress: (id) sender {
    UIButton* operationButton = (UIButton*) sender;
    NSString* operator = operationButton.currentTitle;
    if(([self.expression.text length] == 0 || [[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @" "]) || ([[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @"-"] || [[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @"."])){
    } else {
        NSString* addition = [[NSString alloc] initWithFormat: @" %@ ", operator];
        self.expression.text = [self.expression.text stringByAppendingString: addition];
        hasDecimal = NO;
        hasNegative = NO;
    }
}

- (IBAction) solvePress: (id) sender {
    if([[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @" "] || ([[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @"-"] || [[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @"."])){
    }else{
        NSString* answer = [self.calculator calculate: self.expression.text];
        NSString* completeExpression = [self.expression.text stringByAppendingFormat: @" = %@", answer];
        
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow: 0 inSection: 0];
        [self.oldExpressions addObject: completeExpression];
        NSLog(@"%d", self.oldExpressions.count);
        
        NSArray* array = [[NSArray alloc] initWithObjects: indexPath, nil];
        [self.solvedExpressions insertRowsAtIndexPaths: array withRowAnimation: UITableViewRowAnimationAutomatic];
        
        ExpressionCell* cell = (ExpressionCell*)[self.solvedExpressions cellForRowAtIndexPath:indexPath];
        NSLog(@"%@", cell);
        /*
        cell.oldExpression = [[UITextField alloc] init];
        NSLog(@"cell.oldExpression: %@", cell.oldExpression);
        */
        /*[cell.oldExpression setContentSize: CGSizeMake(self.view.frame.size.width, cell.oldExpression.frame.size.height)];*/
        cell.oldExpression.contentInset = UIEdgeInsetsMake(-8, -8, -8, -8);
        cell.oldExpression.text = [self.oldExpressions objectAtIndex: [self.oldExpressions count]-1];
        NSLog(@"completeExpression: %@ cell.oldExpression.text: %@", [self.oldExpressions objectAtIndex: indexPath.row], cell.oldExpression.text);
        
        self.expression.text = @"";
        [self.solvedExpressions reloadData];
    }    
}

- (IBAction) backSpacePress: (id) sender {
    
    if([self.expression.text length] == 0) {
    }else if([[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @" "]){
        self.expression.text = [self.expression.text substringToIndex: [self.expression.text length]-3];
    }else{
        if([[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @"-"]){
            hasNegative = NO;
        }else if([[self.expression.text substringFromIndex: [self.expression.text length]-1] isEqualToString: @"."]){
            hasDecimal = NO;
        }
        self.expression.text = [self.expression.text substringToIndex: [self.expression.text length]-1];
    }
}

- (IBAction) clearExpressionsPress: (id) sender {
    if([self.oldExpressions count] == 0){
    }else{
        NSIndexPath* indexPath;
        NSArray* array = [[NSArray alloc] init];
        for(int i = 0; i < self.oldExpressions.count; i++){
            indexPath = [NSIndexPath indexPathForRow: i inSection: 0];
            array = [array arrayByAddingObject: indexPath];
        }
        [self.oldExpressions removeAllObjects];
        [self.solvedExpressions deleteRowsAtIndexPaths: array withRowAnimation: UITableViewRowAnimationAutomatic];
        [self.solvedExpressions reloadData];
    }
}

#pragma mark - UITableViewDataSource methods
- (UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath*) indexPath {
    ExpressionCell* cell = (ExpressionCell*)[self.solvedExpressions dequeueReusableCellWithIdentifier: @"ExpressionCell"];
    NSLog(@"%@", cell);
    
    if(!cell){
        cell = [[ExpressionCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"ExpressionCell"];
    }
    
    NSLog(@"After conditional: %@", cell);
    return cell;
}

- (NSInteger) tableView: (UIView*) tableView numberOfRowsInSection: (NSInteger) section {
    return [self.oldExpressions count];
}

- (NSInteger) numberOfSectionsInTableView: (UITableView*) tableView{
    return 1;
}

@end
