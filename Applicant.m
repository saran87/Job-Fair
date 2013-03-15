//
//  Applicant.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/12/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "Applicant.h"

@implementation Applicant
@synthesize GPA;
@synthesize address;
@synthesize age;
@synthesize block;
@synthesize city;
@synthesize email;
@synthesize fname;
@synthesize gender;
@synthesize jobtittle;
@synthesize lname;
@synthesize major;
@synthesize name;
@synthesize phone;
@synthesize quarter;
@synthesize role;
@synthesize state;
@synthesize username;
@synthesize user_id;
@synthesize job;

-(Applicant *)initwithProfile: (NSDictionary *)userInformation
{
    GPA =[userInformation objectForKey:@"GPA"];
    address = [userInformation objectForKey:@"address"];
    age = [userInformation objectForKey:@"age"];
    block = [userInformation objectForKey:@"block"];
    city = [userInformation objectForKey:@"city"];
    email = [userInformation objectForKey:@"email"];
    fname = [userInformation objectForKey:@"fname"];
    gender = [userInformation objectForKey:@"gender"];
    jobtittle = [userInformation objectForKey:@"jobtitle"];
    lname = [userInformation objectForKey:@"lname"];
    major = [userInformation objectForKey:@"major"];
    phone = [userInformation objectForKey:@"phone"];
    quarter = [userInformation objectForKey:@"quarter"];
    role = [userInformation objectForKey:@"role"];
    state = [userInformation objectForKey:@"state"];
    username = [userInformation objectForKey:@"username"];
    user_id =[NSNumber numberWithInteger:[[userInformation objectForKey:@"id_users"] integerValue]];
    job = [NSMutableArray arrayWithObjects:@"Dashboard", @"appliedjob", @"SignOut", nil];
    
    return self;
}
@end
