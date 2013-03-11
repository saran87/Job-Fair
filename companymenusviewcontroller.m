//
//  companymenusviewcontroller.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "companymenusviewcontroller.h"
#import "companymenuitems.h"
#import "companydashboard.h"
@interface companymenusviewcontroller ()

@end

@implementation companymenusviewcontroller
@synthesize data;
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
        companydashboard *dashboard = [self.storyboard instantiateViewControllerWithIdentifier:@"CompanyBoard"];
    dashboard.data = self.data;
   self.topViewController = dashboard;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
