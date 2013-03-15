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
@interface Inqueue : UIViewController <UITableViewDelegate,ServiceProtocol>
@property (strong,nonatomic) UIButton *menubutton;
@property (strong,nonatomic) Applicant *_Applicant;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UITableView *List;
@property (strong, nonatomic) Service *service;
@property (strong, nonatomic) NSMutableArray *data;

@end
