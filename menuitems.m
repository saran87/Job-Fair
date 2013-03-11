//
//  menuitems.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "menuitems.h"
#import"ECSlidingViewController.h"
#import "userdashboard.h"
#import "AppliedJob.h"
#import "CompanyInfo.h"
#import "ViewController.h"
#import "usermenusviewcontroller.h"
@interface menuitems ()

@end

@implementation menuitems
@synthesize menuitems;
@synthesize data;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.menuitems = [NSArray arrayWithObjects:@"Dashboard", @"appliedjob", @"CompanyInfo", @"SignOut", nil];
   
    
    [self.slidingViewController setAnchorRightRevealAmount:145.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    self.tableView.tableFooterView = [[UIView alloc] init];
    usermenusviewcontroller *topview = (usermenusviewcontroller *)[self.slidingViewController topViewController];
    data = topview.data;
    NSLog(@"data %@",data);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.menuitems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.menuitems objectAtIndex:indexPath.row]];
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    id newTopViewController;
    NSString *identifier = [NSString stringWithFormat:@"%@", [self.menuitems objectAtIndex:indexPath.row]];
   
    if([identifier isEqual:[self.menuitems objectAtIndex:0]]){
        NSLog(@"HELP ME %@",data);
       newTopViewController = [[userdashboard alloc]init];
        userdashboard *pop =(userdashboard *)[self.storyboard instantiateViewControllerWithIdentifier:identifier];
        pop.data = self.data;
        newTopViewController = pop;
        NSLog(@"%@",pop.data);
    }
    else if([identifier isEqualToString:@"appliedjob"]){
       
        newTopViewController = [[AppliedJob alloc]init];
        AppliedJob *pop =(AppliedJob *)[self.storyboard instantiateViewControllerWithIdentifier:identifier];
        pop.data = self.data;
        newTopViewController = pop;
        
    }
    else if([identifier isEqualToString:@"CompanyInfo"]){
        newTopViewController = [[CompanyInfo alloc]init];
        CompanyInfo *pop =(CompanyInfo *)[self.storyboard instantiateViewControllerWithIdentifier:identifier];
        pop.data = self.data;
        newTopViewController = pop;
    }
    else if([identifier isEqualToString:@"SignOut"]){
         newTopViewController = [[ViewController alloc]init];
        ViewController *Controller = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        newTopViewController = Controller;
        
    }
    NSLog(@"I AM OUT %@",[newTopViewController class]);

    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = newTopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
    
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSLog(@"Hello");
    if (self.tableView.tag==1)
    {
        if (section == 0)
        {
            return @"User Menu";
        }
    }
    return @"";
}
@end
