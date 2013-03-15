//
//  companydashboard.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "companydashboard.h"
#import "ECSlidingViewController.h"
#import "companymenuitems.h"
#import "menuitems.h"
#import "Service.h"
@interface companydashboard ()

@end

@implementation companydashboard
@synthesize menubutton;
@synthesize data;
@synthesize Date;
@synthesize company;
@synthesize gray;
@synthesize magenda;
@synthesize service;
@synthesize organization;
@synthesize skills;
@synthesize Chart;
@synthesize SkillTable;
@synthesize totalvalue;
@synthesize appliedValue;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    [self.gray setBackgroundColor:[UIColor yellowColor]];
    [self.magenda setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.menubutton];
    self.service = [[Service alloc]init];
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
-(void)ServiceRequestComplete:(NSDictionary *)response serviceStatus:(NSString *)status{
    self.organization = [[Organization alloc] initwithProfile:response];
    NSLog(@"%@",response);
    self.Date.text = @"7/9/2012";
   [self.company setTitle:self.organization.website forState:UIControlStateNormal];
     NSLog(@"%@",self.company.titleLabel.text);
    self.skills = [NSArray arrayWithObjects:@"C++",@"C",@"PHP", nil];
    NSNumber *slice = [[NSNumber alloc] initWithFloat:10.0];
    NSNumber *total = [[NSNumber alloc] initWithFloat:30.0];
    NSLog(@"%@ %@",slice,total);
    [self.Chart initWithPieData:slice :total];
    [self.Chart setNeedsDisplay];
    self.appliedValue.text = [NSString stringWithFormat:@"%.1f",slice.floatValue];
    self.totalvalue.text = [NSString stringWithFormat:@"%.1f",total.floatValue];
    self.SkillTable.backgroundColor = [UIColor clearColor];
    [self.SkillTable reloadData];
    
}
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [self.slidingViewController anchorTopViewTo:ECRight];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    cell.detailTextLabel.text = @"12%";
    return cell;
}

-(BOOL)canBecomeFirstResponder{
    
    return YES;
}

- (IBAction)HyperLink:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.company.titleLabel.text]]];
}
@end
