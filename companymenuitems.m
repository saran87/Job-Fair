//
//  companymenuitems.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "companymenuitems.h"
#import "ECSlidingViewController.h"
#import "companymenusviewcontroller.h"
#import "companydashboard.h"
#import "ViewController.h"
#import "Inqueue.h"
@interface companymenuitems ()

@end

@implementation companymenuitems
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
    
    self.menuitems = [NSArray arrayWithObjects:@"CompanyBoard", @"In queue", @"SignOut", nil];
    
    
    [self.slidingViewController setAnchorRightRevealAmount:145.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    self.tableView.tableFooterView = [[UIView alloc] init];
   companydashboard *topview = (companydashboard *)[self.slidingViewController topViewController];
    data = topview.data;
    NSLog(@"MY DATA %@",data);
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
        newTopViewController = [[companydashboard alloc]init];
        companydashboard *pop =(companydashboard *)[self.storyboard instantiateViewControllerWithIdentifier:identifier];
        pop.data = self.data;
        newTopViewController = pop;
        NSLog(@"%@",pop.data);
    }
    else if([identifier isEqualToString:@"In queue"]){
        
        newTopViewController = [[Inqueue alloc]init];
        Inqueue *pop =[self.storyboard instantiateViewControllerWithIdentifier:identifier];
        pop.data = self.data;
        newTopViewController = pop;
        
    }
   else if([identifier isEqualToString:@"SignOut"]){
        newTopViewController = [[ViewController alloc]init];
        ViewController *Controller = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        newTopViewController = Controller;
        
    }
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
            return @"Menu";
        }
        
    }
    return @"";
}

@end
