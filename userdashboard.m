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
#import "PieChart.h"
@interface userdashboard ()

@end

@implementation userdashboard
@synthesize menubutton;
@synthesize label;
@synthesize userview;
@synthesize data;
@synthesize table;
@synthesize name;
@synthesize role;
@synthesize Chart;

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
    [menubutton  setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
    [menubutton  addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:self.menubutton];
    //[self.view addSubview:self.Chart ];
   NSLog(@"NAME at dash:%@",[data objectForKey:@"name"]);
    self.label.text = [data objectForKey:@"name"];
    self.name.text = [data objectForKey:self.name.text];
    self.role.text = [data objectForKey:self.role.text];
    NSNumber *pieData = [[NSNumber alloc] initWithFloat:15.0];
    //sel.Chart = [[PieChart alloc] initWithPieData:pieData];
    [self.Chart initWithPieData:pieData];
    NSLog(@"final%f",[self.Chart.PieData floatValue]);
    

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



@end
