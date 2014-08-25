//
//  STANewGroupViewController.m
//  Simple Tasks
//
//  Created by Katlyn Schwaebe on 7/31/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "STANewGroupViewController.h"

@interface STANewGroupViewController () <UITextFieldDelegate>

@end

@implementation STANewGroupViewController
{
    UITextField * groupNameField;
}

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
    // Do any additional setup after loading the view.
    
    groupNameField = [[UITextField alloc] initWithFrame: CGRectMake(20, 20, SCREEN_WIDTH -40, 40)];
    [self.view addSubview:groupNameField];
    [groupNameField becomeFirstResponder];
    groupNameField.delegate = self;
    UIView * fieldBar = [[UIView alloc] initWithFrame:CGRectMake(20, 60, SCREEN_WIDTH -40, 1)];
    fieldBar.backgroundColor = [UIColor blackColor];
    [self.view addSubview:fieldBar];
    
    UIButton * cancelGroup = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2.0-110, 80, 100, 100)];
    [cancelGroup setImage: [UIImage imageNamed: @"group_close"] forState: UIControlStateNormal];
    [cancelGroup addTarget:self action:@selector(cancelGroupClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: cancelGroup];
    cancelGroup. adjustsImageWhenHighlighted = NO;
    
    
    UIButton *saveGroup = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH /2.0 +10, 80, 100, 100)];
    [saveGroup setImage:[UIImage imageNamed:@"group_save"] forState: UIControlStateNormal];
    [saveGroup addTarget:self action:@selector(saveGroupClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: saveGroup];
    saveGroup. adjustsImageWhenHighlighted = NO;

    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    [self saveGroupClicked];
    return YES;
    

}
- (void)cancelGroupClicked
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)saveGroupClicked
{
    [self.groups addObject:[@{
                              @"name":groupNameField.text,
                              @"items":[@[] mutableCopy]
                              } mutableCopy]];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    // :)you can also use this for this function[self cancelGroupClicked];
}

-(BOOL) prefersStatusBarHidden {return YES;}

@end
