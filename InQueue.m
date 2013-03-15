//
//  Inqueue.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "InQueue.h"
#import "ECSlidingViewController.h"
#import "companymenuitems.h"
@interface InQueue ()

@end

@implementation InQueue
@synthesize menubutton;
@synthesize data;
@synthesize service;
@synthesize List;
@synthesize lister;
@synthesize applicantdata;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSLog(@"VIEW LOADED");
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[companymenuitems class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"companyitems"];
    }
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    
    self.menubutton = [UIButton buttonWithType:UIButtonTypeCustom];
    menubutton .frame = CGRectMake(8, 10, 34, 24);
   // [menubutton  setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menubutton  addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
//    self.label.text = data.fname;
    [self.view addSubview:self.menubutton ];
    self.service = [[Service   alloc]init];
    self.service.delegate = self;
      NSMutableDictionary *newdata = [[NSMutableDictionary alloc] init];
    NSLog(@"%@",data);
    [newdata setObject:[data objectForKey:@"userid"] forKey:@"email"];
    [self.service MakeCall:newdata ConnectionString:JOB];
}

- (IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [self.data count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.lister objectAtIndex:indexPath.row]];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    NSString *identifier = [NSString stringWithFormat:@"%@", [self.lister objectAtIndex:indexPath.row]];
    
    //int index = [self.menuitems indexOfObject:identifier];
   // TopViewController = [self.controller objectAtIndex:index];
    [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
        CGRect frame = self.slidingViewController.topViewController.view.frame;
      // self.slidingViewController.topViewController = TopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    }];
    
    
}
-(void)ServiceRequestComplete:(NSDictionary *)response serviceStatus:(NSString *)status{
    
    NSLog(@"APPLIED JOB%@",response);
    self.applicantdata = [response objectForKey:@"data"];
    NSLog(@"JOB  %@",self.applicantdata);
    self.lister = [[NSMutableArray alloc] init];
    for(NSDictionary *dataIter in applicantdata)
    {
        NSLog(@"Company name RESPONSE %@",[dataIter objectForKey:@"companyName"]);
        [self.lister addObject:[dataIter objectForKey:@"fname"]];
    }
[self.List reloadData];
}
@end
