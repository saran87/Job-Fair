//
//  ViewController.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UIButton *signin;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) NSMutableData * requireddata;
@property (nonatomic, strong) NSURLConnection *connection;
- (IBAction)release:(id)sender;

- (IBAction)signIn:(id)sender;
@end
