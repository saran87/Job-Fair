//
//  AppliedJob.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Applicant.h"
#import "Service.h"
@interface AppliedJob : UIViewController <UITableViewDelegate>
@property (strong,nonatomic) UIButton *menubutton;
@property (strong, nonatomic) IBOutlet UITableView *JobList;
@property (strong,nonatomic) NSMutableDictionary *data;
@property (strong,nonatomic) Applicant *_Applicant;
@property (strong, nonatomic) NSMutableArray *list;
@property (strong, nonatomic) Service *service;

@end
