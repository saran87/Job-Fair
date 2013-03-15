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
    GPA =[[userInformation objectForKey:@"data"] objectForKey:@"GPA" ];
    address = [[userInformation objectForKey:@"data"] objectForKey:@"address" ];
    age = [[userInformation objectForKey:@"data"] objectForKey:@"age" ];
    block = [[userInformation objectForKey:@"data"] objectForKey:@"block" ];
    city = [[userInformation objectForKey:@"data"] objectForKey:@"city" ];
    email = [[userInformation objectForKey:@"data"] objectForKey:@"email" ];
   
    fname = [[userInformation objectForKey:@"data"] objectForKey:@"fname" ];
    gender = [[userInformation objectForKey:@"data"] objectForKey:@"gender" ];;
    jobtittle = [[userInformation objectForKey:@"data"] objectForKey:@"jobtitle" ];;
    lname = [[userInformation objectForKey:@"data"] objectForKey:@"lname" ];;
    major = [[userInformation objectForKey:@"data"] objectForKey:@"major" ];;
    phone = [[userInformation objectForKey:@"data"] objectForKey:@"phone" ];;
    quarter = [[userInformation objectForKey:@"data"] objectForKey:@"quarter" ];;
    role = [[userInformation objectForKey:@"data"] objectForKey:@"role" ];
    state = [[userInformation objectForKey:@"data"] objectForKey:@"state" ];
    username = [[userInformation objectForKey:@"data"] objectForKey:@"username" ];
    
    user_id = [[userInformation objectForKey:@"data"] objectForKey:@"id_users" ];
    job = [NSMutableArray arrayWithObjects:@"Dashboard", @"appliedjob", @"SignOut", nil];
    
    return self;
}
@end
