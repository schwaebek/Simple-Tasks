//
//  STANewItemViewController.m
//  Simple Tasks
//
//  Created by Katlyn Schwaebe on 7/31/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "STANewItemViewController.h"
#import "STAItemsTableViewController.h"

@interface STANewItemViewController () <UITextFieldDelegate>

@end

@implementation STANewItemViewController


{
UITextField * itemNameField;
UIButton * dragView;
   
    //UIScrollView * scroll;
 
   /// UIScrollViewKeyboardDismissMode * changeColorWithTouches;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        self.view.backgroundColor = [UIColor orangeColor];
    }
    return self;

}
- (void)viewDidLoad
{
    [super viewDidLoad];
   // self.view.backgroundColor [UIColor orangeColor];
  /*  {
        [super viewDidLoad];
        // Do any additional setup after loading the view.
        
        [super viewDidLoad];
        
        // create a label
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 50)];
                          label.text = @"Drag me!";
                          
                          // enable touch delivery
                          label.userInteractionEnabled = YES;
                          
                          UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]
                                                              initWithTarget:self
                                                             action:@selector(labelDragged:)];
                          [label addGestureRecognizer:gesture];
                          
                          // add it
                          [self.view addSubview:label];
                          }
                          
                          - (void)labelDragged:(UIPanGestureRecognizer *)gesture
                          {
                              UILabel *label = (UILabel *)gesture.view;
                              CGPoint translation = [gesture translationInView:label];
                              
                              // move label
                              label.center = CGPointMake(250, 100);
                              
                              // reset translation
                              [gesture setTranslation:CGPointZero inView:label]; */
    
    
    //itemNameField = [[UITextField alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH - 40, 40)];
    //itemNameField.text = itemInfo [@"name"];
   
   
    dragView = [[UIButton alloc] initWithFrame:CGRectMake(10 , 10, SCREEN_WIDTH -40, 40)];
    [dragView setTag: 101];
    [self.view addSubview:dragView];
    
    
        itemNameField = [[UITextField alloc] initWithFrame: dragView.frame];
        //[self.view addSubview:itemNameField];
        itemNameField.delegate = self;
        [dragView addSubview:itemNameField];
    
    
    
        UIView * fieldBar = [[UIView alloc] initWithFrame:CGRectMake(10, 50, SCREEN_WIDTH -40, 1)];
        fieldBar.backgroundColor = [UIColor blackColor];
        [dragView addSubview:fieldBar];
    
        
        
        UIButton * cancelGroup = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2.0-110, SCREEN_HEIGHT -130, 100, 100)];
        [cancelGroup setImage: [UIImage imageNamed: @"item_close"] forState: UIControlStateNormal];
        [cancelGroup addTarget:self action:@selector(cancelItemClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: cancelGroup];
        cancelGroup. adjustsImageWhenHighlighted = NO;
        
        
        UIButton *saveGroup = [[UIButton alloc] initWithFrame:CGRectMake(165, SCREEN_HEIGHT -130, 100, 100)];
        [saveGroup setImage:[UIImage imageNamed:@"item_save"] forState: UIControlStateNormal];
        [saveGroup addTarget:self action:@selector(saveItemClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: saveGroup];
        saveGroup. adjustsImageWhenHighlighted = NO;

    // Do any additional setup after loading the view.
        //[scrolldown setScrollEnabled:YES];
        //[scrolldown setContentSize:CGSizeMake(320, 650)];    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self saveItemClicked];
    return YES;
    //[textField resignFirstResponder];
}

 //   - (void)textFieldDidBeginEditing:(UITextField *)itemNameField
//{
//    self.view.scroll = CGPointMake(250, -20);
   
     
// tried to make text field only appear when tapping in text box
/*-(void) textFieldDidEndEditing:(UITextField *)textField
{
     [self.view endEditing:YES];
    [self.view touchesBegan:textField withEvent:UIAc */

-(void)setItemInfo: (NSMutableDictionary *) itemInfo
{
    //itemInfo = itemInfo;
    
    }
-(void) cancelItemClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void) saveItemClicked
{
    
    [self.items addObject:[@{
                           @"name": itemNameField.text,
                           @"priority": @30
                           } mutableCopy]];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
        UITouch * touch = [[event allTouches] anyObject];
        if ([[touch view]tag] == 101 && [touch tapCount] == 1)
            //[itemNameField becomeFirstResponder];
        {
            [itemNameField becomeFirstResponder];
        }
        //CGPoint location = [touch locationInView:self.view];
    [self changeColorWithLocation:[[touches allObjects][0] locationInView:self.view]];
    
    }
    
    -(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
    {
        UITouch * touch = [[event allTouches] anyObject];
        CGPoint location = [touch locationInView:self.view];
        dragView.center = CGPointMake(itemNameField.center.x, location.y);
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
@end
