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
#import <CoreMotion/CoreMotion.h>
@interface menuitems ()

@end

@implementation menuitems
@synthesize menuitems;
@synthesize data;
@synthesize TopViewController;
@synthesize controller;
@synthesize _Applicant;
@synthesize Table;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}
-(BOOL)canBecomeFirstResponder{
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.menuitems = [NSMutableArray arrayWithObjects:@"Dashboard", @"Appliedjob", @"SignOut", nil];
    self.controller = [[NSMutableArray alloc] init];
   [self.slidingViewController setAnchorRightRevealAmount:145.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    self.tableView.tableFooterView = [[UIView alloc] init];
    usermenusviewcontroller *topview = (usermenusviewcontroller *)[self.slidingViewController topViewController];
    data = topview.data;
    NSLog(@"data %i",[self.controller count]);
    [self CreateControllers];
    self.Table.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TableBG.png"] ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSLog(@"BECAME FIRST RESPONDER");
    [self becomeFirstResponder];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    NSLog(@"SHAKE!!!!!");
     TopViewController = [self.slidingViewController topViewController];
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = TopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
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
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.menuitems objectAtIndex:indexPath.row]];
    
    return cell;
}

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
    
    NSString *identifier = [NSString stringWithFormat:@"%@", [self.menuitems objectAtIndex:indexPath.row]];
   
        int index = [self.menuitems indexOfObject:identifier];
    NSLog(@"%@",menuitems);
        TopViewController = [self.controller objectAtIndex:index];
        [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = TopViewController;
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
-(void)CreateControllers{
 
    for(int i = 0;i < [self.menuitems count]; i++)
    {
    
        NSString *identifier = [NSString stringWithFormat:@"%@", [self.menuitems objectAtIndex:i]];
        userdashboard *pop =(userdashboard *)[self.storyboard instantiateViewControllerWithIdentifier:identifier];
        if(![identifier isEqualToString:@"SignOut"])
        {
            pop.data = data;
        }
        [self.controller addObject:pop];
    }
    
}

@end
