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
@interface CompanyInfo ()

@end

@implementation CompanyInfo
@synthesize menubutton;
@synthesize data;
@synthesize _Applicant;
@synthesize service;
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
    self.service = [[Service   alloc]init];
    self.service.delegate = self;
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
-(void)ServiceRequestComplete:(NSDictionary *)response serviceStatus:(NSString *)status{
    
    NSLog(@"Roshan RECIEVED%@",response);
    self._Applicant = [[Applicant alloc] initwithProfile:response];
     NSLog(@"Roshan RECIEVED TITTLE%@",self._Applicant.address);
    self.MenuTittle.text = self._Applicant.jobtittle;
    [self.MenuTittle reloadInputViews];
}
- (IBAction)Back:(id)sender {
    
    [self performSegueWithIdentifier:@"company" sender:data];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue");
    NSLog(@"DATA%@",data);
    AppliedJob *dest = (AppliedJob *)segue.destinationViewController;
    NSLog(@"DESTINATION %@", dest);
    dest.data = data;
    
}
@end
