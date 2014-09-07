//
//  STAItemsTableViewController.m
//  Simple Tasks
//
//  Created by Katlyn Schwaebe on 7/30/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

#import "STAItemsTableViewController.h"
#import "STAEditItemViewController.h"
#import "STANewItemViewController.h"

@interface STAItemsTableViewController ()

@end

@implementation STAItemsTableViewController

{
    UITextField *textBox;
    NSMutableArray *groups;
    NSMutableArray *items;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem * addNewItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItemClicked)];
    self.navigationItem.rightBarButtonItem = addNewItem;
    
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    NSMutableArray * items = self.groupInfo[@"items"];
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    float priority = [self.groupInfo[@"items"][indexPath.row][@"priority"] floatValue];
    float priorityHue = priority/360;
    cell.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    cell.textLabel.text = self.groupInfo[@"items"][indexPath.row][@"name"];
    
    //self.view.backgroundColor = [UIColor colorWithHue:0 saturation:1.0 brightness:1.0 alpha:1.0];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    STAEditItemViewController * editItemVC = [[STAEditItemViewController alloc] init];
    float priority = [self.groupInfo[@"items"][indexPath.row][@"priority"] floatValue];
    float priorityHue = priority/360;

    editItemVC.itemInfo = self.groupInfo[@"items"][indexPath.row];
    editItemVC.view.backgroundColor = [UIColor colorWithHue:priorityHue saturation:1.0 brightness:1.0 alpha:1.0];
    [self.navigationController pushViewController:editItemVC animated:YES];
   
}
-(void) addNewItemClicked
{
    STANewItemViewController * addNewItemVC = [[STANewItemViewController alloc] init];
    
    addNewItemVC.items = self.groupInfo [@"items"];
    
    [self.navigationController presentViewController:addNewItemVC animated: YES completion:nil];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

 //Override to support editing the table view.

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
      //  [items removeObjectAtIndex: indexPath.row];
        
        
       [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (BOOL) prefersStatusBarHidden { return YES;}

@end
