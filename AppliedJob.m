//
//  AppliedJob.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "AppliedJob.h"
#import "ECSlidingViewController.h"
#import "menuitems.h"
#import "CompanyInfo.h"
#import <CoreMotion/CoreMotion.h>

@interface AppliedJob ()
@end
@implementation AppliedJob
@synthesize menubutton;
@synthesize data;
@synthesize JobList;
@synthesize list;
@synthesize service;
@synthesize jobdata;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.service = [[Service   alloc]init];
    self.service.delegate = self;
    NSLog(@"NAME at user:%@",data);
    NSMutableDictionary *newdata = [[NSMutableDictionary alloc] init];
    [newdata setObject:[data objectForKey:@"userid"] forKey:@"userid"];
     NSLog(@"NEWDATA at user:%@",data);
    [self.service MakeCall:newdata ConnectionString:JOB];
     
    [self becomeFirstResponder];
  
}
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[menuitems class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"items"];
       
        NSLog(@"BREAK%@",self.slidingViewController.panGesture);
    }
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    NSLog(@"BREAK");
       self.list = [NSArray arrayWithObjects:@"Hello",@"Hi", nil];
    NSLog(@"BREAK");
    self.menubutton = [UIButton buttonWithType:UIButtonTypeCustom];
    menubutton .frame = CGRectMake(8, 10, 34, 24);
    //[menubutton  setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menubutton  addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    self.JobList.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.menubutton ];
   
    
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
    return [self.list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.list objectAtIndex:indexPath.row]];
  
    cell.detailTextLabel.text = [[self.jobdata objectAtIndex:indexPath.row] objectForKey:@"jobtitle"];
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    CompanyInfo *TopViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CompanyInfo"];
    TopViewController.data = [self.jobdata objectAtIndex:indexPath.row];
   
        CGRect frame = self.slidingViewController.topViewController.view.frame;
        self.slidingViewController.topViewController = TopViewController;
        self.slidingViewController.topViewController.view.frame = frame;
        [self.slidingViewController resetTopView];
    

}

-(void)ServiceRequestComplete:(NSDictionary *)response serviceStatus:(NSString *)status{
   
    NSLog(@"JOB RESPONSE %@",response);
    self.jobdata = [response objectForKey:@"data"];
    NSLog(@"JOB  %@",self.jobdata);
    self.list = [[NSMutableArray alloc] init];
    for(NSDictionary *dataIter in jobdata)
        {
             NSLog(@"Company name RESPONSE %@",[dataIter objectForKey:@"companyName"]);
                [self.list addObject:[dataIter objectForKey:@"companyName"]];
        }
    
        [self.JobList reloadData];
}

-(BOOL)canBecomeFirstResponder{
    
    return YES;
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [self.slidingViewController anchorTopViewTo:ECRight];
}
@end
