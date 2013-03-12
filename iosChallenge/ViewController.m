//
//  ViewController.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "ViewController.h"
#import "usermenusviewcontroller.h"
#import "companymenusviewcontroller.h"
#import "menuitems.h"
#define movementDuration .3
#define isWide ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
@interface ViewController ()

@end

@implementation ViewController
@synthesize username;
@synthesize password;
@synthesize signin;
@synthesize requireddata;
@synthesize connection;
bool keyboardIsShown = NO;
int movement = 0;
int movementDistance = 130;

- (void)viewDidLoad
{
    [super viewDidLoad];
    username.delegate = self;
    password.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
    [self animateTextField: textField up: YES];
    NSLog(@"Hi");
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    [self animateTextField: textField up: NO];
}
- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    
    
    
    
    
    if(!isWide)
    {
       
        movement = (up ? -movementDistance : movementDistance);
    }
    else
    {
        
        movementDistance = 100;
        movement = (up ? -movementDistance : movementDistance);
    }
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
    
    
}


- (IBAction)release:(id)sender {
    [self.view endEditing:YES ];
}

- (IBAction)signIn:(id)sender {


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSDictionary *)data{
    if([[data objectForKey:@"role"] isEqualToString:@"user"])
    {
        usermenusviewcontroller *destination = (usermenusviewcontroller *)segue.destinationViewController;
        destination.data = data;
    }
    else if([[data objectForKey:@"role"] isEqualToString:@"user"])
    {
        NSLog(@"I AM IN");
        companymenusviewcontroller *destination = (companymenusviewcontroller *)segue.       destinationViewController;
        destination.data = data;
    }
}
@end
