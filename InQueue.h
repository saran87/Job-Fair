//
//  Inqueue.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Applicant.h"
#import "Service.h"
#import "UserInformation.h"
@interface InQueue : UIViewController <UITableViewDelegate>
@property (strong,nonatomic) UIButton *menubutton;
@property (strong,nonatomic) Applicant *_Applicant;
@property (strong, nonatomic) IBOutlet UITableView *List;
@property (strong, nonatomic) Service *service;
@property (strong, nonatomic) NSMutableDictionary *data;
@property (strong, nonatomic) NSMutableArray *applicantdata;
@property (strong, nonatomic) UserInformation *propogateData;
@property (strong, nonatomic) NSMutableArray *lister;
@end
