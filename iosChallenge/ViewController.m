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
    NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://saravananadar.com/jobfair/index.php?s=login"]
                                                            cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                        timeoutInterval:60.0];
    // create the connection with the request
    // and start loading the data
    NSString *params = [[NSString alloc] initWithFormat:@"email=%@&password=%@",username.text,password.text];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    // Create the request.
if (theConnection) {
        // Create the NSMutableData to hold the received data.
        // requireddata is an instance variable declared elsewhere.
       requireddata = [NSMutableData data];
        NSLog(@"%@",requireddata);
    } else {
        // Inform the user that the connection failed.
        NSLog(@"Not Recieved");
    }
   
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:
(NSURLResponse *)response
{
    // Discard all previously received data.
    NSLog( @"Succeeded! Received bytes of data");
    NSLog(@"%@",response.URL);
    [requireddata setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:
(NSData *)data
{
    // Append the new data to the receivedData.
    // NSLog( @"Succeeded! Received bytes of data");
    [requireddata appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Connection succeeded in downloading the request.
    NSLog( @"Succeeded! Received %d bytes of data", [requireddata length] );
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:requireddata options:0 error:nil];
    NSLog(@"%@",[data objectForKey:@"name"]);
    if([data objectForKey:@"name"] != NULL)
    {
        if([[data objectForKey:@"role"] isEqualToString:@"user"])
        {
            [self performSegueWithIdentifier:@"userseque" sender:data];
        }
        else if([[data objectForKey:@"role"] isEqualToString:@"user"])
        {
            [self performSegueWithIdentifier:@"companyseque" sender:data];
        }
    }
}
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
