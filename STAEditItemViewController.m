//
//  STAEditItemViewController.m
//  Simple Tasks
//
//  Created by Katlyn Schwaebe on 7/30/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "STAEditItemViewController.h"

@interface STAEditItemViewController () <UITextFieldDelegate>

@end

@implementation STAEditItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor whiteColor];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    }
    // Do any additional setup after loading the view.
-(void)setItemInfo: (NSMutableDictionary *) itemInfo
{
    _itemInfo = itemInfo;

    UITextField * itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 40)];


    itemNameField.text = itemInfo [@"name"];
    itemNameField.delegate = self;

    [self.view addSubview:itemNameField];

}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    self.itemInfo[@"name"] = textField.text;
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches allObjects] [0];
    CGPoint location = [touch locationInView:self.view];
    [self changeColorWithLocation:location];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //UITouch * touch = [touches allObjects] [0];
    //CGPoint location = [touch locationInView:self.view];
    [self changeColorWithLocation:[[touches allObjects][0]locationInView:self.view]];
    
}
-(void)changeColorWithTouches: (NSSet*) touches
{
    UITouch * touch = [touches allObjects] [0];
    CGPoint location = [touch locationInView:self.view];
    
    
    float priority = location.y/SCREEN_HEIGHT * 60;
    NSLog(@"y = %f", priority);
    self.itemInfo[@"priority"] = @(priority);
    float priorityHue = priority / 360;
    
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1 brightness:1 alpha:1];
}
-(void)changeColorWithLocation: (CGPoint)location
{
    float priority = location.y / SCREEN_HEIGHT *60;
    self.itemInfo [@"priority"] = @(priority);
    NSLog(@"y = %f", priority/60.0);
    float priorityHue = priority/360;
    self.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    
}

-(BOOL) prefersStatusBarHidden {return YES;}

@end
