//
//  userdashboard.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "userdashboard.h"
#import "usermenusviewcontroller.h"
#import "ECSlidingViewController.h"
#import "menuitems.h"
#import "Const.h"
#import "PieChart.h"
#import "Applicant.h"
#import <CoreMotion/CoreMotion.h>
@interface userdashboard ()

@end

@implementation userdashboard
@synthesize menubutton;
@synthesize major;
@synthesize date;
@synthesize userview;
@synthesize data;
@synthesize Percentage_Applied;
@synthesize Percentage_potential;
@synthesize Chart;
@synthesize _Applicant;
@synthesize service;

-(BOOL)canBecomeFirstResponder{
   
    return YES;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.service = [[Service   alloc]init];
    self.service.delegate = self;
    NSLog(@"NAME at user:%@",data);
    [self.service MakeCall:data ConnectionString:LOGINURL];
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[menuitems class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"items"];
    }
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
       self.menubutton = [UIButton buttonWithType:UIButtonTypeCustom];
    menubutton .frame = CGRectMake(8, 10, 34, 24);
    //s[menubutton  setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menubutton  addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.Grey setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.menubutton];
   self.service = [[Service   alloc]init];
    self.service.delegate = self;
    NSLog(@"NAME at user:%@",data);
      [self.service MakeCall:data ConnectionString:LOGINURL];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSLog(@"BECAME FIRST RESPONDER");
    [self becomeFirstResponder];
    
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

-(void)ServiceRequestComplete:(NSDictionary *)response serviceStatus:(NSString *)status{
    
    NSLog(@"DATA RECIEVED%@",response);
    self._Applicant = [[Applicant alloc] initwithProfile:response];
    NSLog(@"NAME at response:%@",self._Applicant.fname);
    NSLog(@"NAME at dash:%@",self._Applicant.fname);
    self.Percentage_Applied.text = [NSString stringWithFormat:@"%.1f%%", 11.0];
    self.Percentage_potential.text = [NSString stringWithFormat:@"%.1f%%", 30.0];
    self.major.text = _Applicant.major;
    self.date.text = _Applicant.fname;
    self.skills = [NSArray arrayWithObjects:@"C++",@"C",@"PHP", nil];
    NSNumber *pieData = [[NSNumber alloc] initWithFloat:11.0];
    NSNumber *pieDataTotal = [[NSNumber alloc] initWithFloat:30.0];
    [self.Chart initWithPieData:pieData:pieDataTotal];
    [self.Chart setNeedsDisplay];
    NSLog(@"final%f",[self.Chart.PieData floatValue]);
    self.SkillTable.backgroundColor = [UIColor clearColor];
    [self.SkillTable reloadData];
}
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
   [self.slidingViewController anchorTopViewTo:ECRight];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"TABLE!!!!!!!!");
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [self.skills count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [self.skills objectAtIndex:indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.numberOfLines = 2;
    return cell;
}

@end
