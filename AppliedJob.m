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
@interface AppliedJob ()

@end

@implementation AppliedJob
@synthesize menubutton;
@synthesize data;
@synthesize JobList;
@synthesize list;
@synthesize service;
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
    self.service = [[Service   alloc]init];
    self.service.delegate = self;
    NSLog(@"NAME at user:%@",data);
    [self.service MakeCall:data ConnectionString:LOGINURL];
    
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
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"company" sender:data];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue");
    NSLog(@"DATA%@",data);
    CompanyInfo *dest = (CompanyInfo *)segue.destinationViewController;
    dest.data = data;
    
}
-(void)ServiceRequestComplete:(NSDictionary *)response serviceStatus:(NSString *)status{
    
    NSLog(@"DATA RECIEVED%@",response);
    self._Applicant = [[Applicant alloc] initwithProfile:response];
    self.list = self._Applicant.job;
    [self.JobList reloadData];
}

@end
