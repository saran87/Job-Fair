//
//  CompanyInfo.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "CompanyInfo.h"
#import "ECSlidingViewController.h"
#import "menuitems.h"
#import "Applicant.h"
#import "AppliedJob.h"
#import "companymenuitems.h"
@interface CompanyInfo ()

@end

@implementation CompanyInfo
@synthesize menubutton;
@synthesize data;
@synthesize _Applicant;
@synthesize service;
@synthesize jobtitle;
@synthesize jobdescription;
@synthesize city;
@synthesize quarter;
@synthesize salary;
@synthesize gpa;
@synthesize Address;
@synthesize bground;
@synthesize Enque;
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
    NSLog(@"LOADED");
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[menuitems class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"items"];
        
        NSLog(@"BREAK%@",self.slidingViewController.panGesture);
    }
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    NSLog(@"BREAK");
    NSLog(@"BREAK");
    self.menubutton = [UIButton buttonWithType:UIButtonTypeCustom];
    menubutton .frame = CGRectMake(8, 10, 34, 24);
    //[menubutton  setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menubutton  addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.menubutton ];
    
   
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.MenuTittle.text = [(NSDictionary *)data objectForKey:@"companyName"];
    self.jobtitle.text = [(NSDictionary *)data objectForKey:@"jobtitle"];
    self.Address.text = [(NSDictionary *)data objectForKey:@"address"];
    self.gpa.text = [NSString stringWithFormat:@"%.2f",[[(NSDictionary *)data objectForKey:@"GPA"] floatValue]];
    self.city.text = [(NSDictionary *)data objectForKey:@"city"];
    self.salary.text = [NSString stringWithFormat:@"%.3f",[[(NSDictionary *)data objectForKey:@"salary"] floatValue]];
    self.quarter.text = [(NSDictionary *)data objectForKey:@"quarter"];
    self.jobdescription.text = [(NSDictionary *)data objectForKey:@"jobdescription1"];
    if([[(NSDictionary *)data objectForKey:@"applied"] isEqualToNumber:[NSNumber numberWithInt:1]])
    {
        [self.bground setImage:[UIImage imageNamed:@"Applied"]];
    }
    if([[(NSDictionary *)data objectForKey:@"inqueue"] isEqualToNumber:[NSNumber numberWithInt:1]])
    {
        [self.Enque setTitle:@"queued" forState:UIControlStateNormal];
    }
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

-(BOOL)canBecomeFirstResponder{
    
    return YES;
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSLog(@"BECAME FIRST RESPONDER");
    [self becomeFirstResponder];
    
}
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [self.slidingViewController anchorTopViewTo:ECRight];
}
- (IBAction)queue:(id)sender {
    self.service = [[Service alloc]init];
    self.service.delegate = self;
    NSLog(@"NAME at user:%@",data);
    NSMutableDictionary *newData = [[NSMutableDictionary alloc] init];
    
    [newData setObject:[_Applicant objectForKey:@"userid"] forKey:@"userid"];
    [newData setObject:[(NSDictionary *)data objectForKey:@"job_id"] forKey:@"jobid"];
    [self.service MakeCall:newData ConnectionString:ENQUEUE];
         [self.Enque setTitle:@"Queued" forState:UIControlStateNormal];
    
}

- (IBAction)Apply:(id)sender {
    self.service = [[Service alloc]init];
    self.service.delegate = self;
    NSLog(@"NAME at user:%@",data);
    NSMutableDictionary *newData = [[NSMutableDictionary alloc] init];
    [newData setObject:[(NSDictionary *)data objectForKey:@"job_id"] forKey:@"jobid"];
    [newData setObject:[_Applicant objectForKey:@"userid"] forKey:@"userid"];
    [self.service MakeCall:newData ConnectionString:APPLY];
    [self.bground setImage:[UIImage imageNamed:@"Applied"]];
      
}
     -(void)ServiceRequestComplete:(NSDictionary *)response serviceStatus:(NSString *)status{
         if([[response objectForKey:@"applied"] isEqualToNumber:[NSNumber numberWithInt:1]])
         {
            [self.bground setImage:[UIImage imageNamed:@"Applied"]];
         }
         if([[response objectForKey:@"inqueue"] isEqualToNumber:[NSNumber numberWithInt:1]])
         {
              [self.Enque setTitle:@"queued" forState:UIControlStateNormal];
         }
        
     }
@end
