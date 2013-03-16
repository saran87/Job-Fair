//
//  Applicant.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/12/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Job.h"
@interface Applicant : NSObject
@property (strong,nonatomic)NSNumber *GPA;
@property (strong,nonatomic)NSString *address;
@property (strong,nonatomic)NSNumber *age;
@property (strong,nonatomic)NSString *block;
@property (strong,nonatomic)NSString *city;
@property (strong,nonatomic)NSString *email;
@property (strong,nonatomic)NSString *fname;
@property (strong,nonatomic)NSString *gender;
@property (strong,nonatomic)NSString *jobtittle;
@property (strong,nonatomic)NSString *lname;
@property (strong,nonatomic)NSString *major;
@property (strong,nonatomic)NSString *name;
@property (strong,nonatomic)NSString *phone;
@property (strong,nonatomic)NSString *quarter;
@property (strong,nonatomic)NSString *role;
@property (strong,nonatomic)NSString *state;
@property (strong,nonatomic)NSString *username;
@property (strong,nonatomic)NSNumber *user_id;
@property (strong,nonatomic)NSMutableArray *job;


-(Applicant *)initwithProfile: (NSDictionary *)userInformation;

@end
