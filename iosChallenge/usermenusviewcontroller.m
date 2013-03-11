//
//  usermenusviewcontroller.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "usermenusviewcontroller.h"
#import "ECSlidingViewController.h"
#import "userdashboard.h"
#import "menuitems.h"

@interface usermenusviewcontroller ()

@end

@implementation usermenusviewcontroller
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
    NSLog(@"NAME controller:%@",[data objectForKey:@"name"]);
    menuitems *usermenu = [self.storyboard instantiateViewControllerWithIdentifier:@"items"];
    usermenu.data = self.data;
    userdashboard *dashboard = [self.storyboard instantiateViewControllerWithIdentifier:@"Dashboard"];
    dashboard.data = self.data;
    self.topViewController = dashboard;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];// Dispose of any resources that can be recreated.
    
}

@end
