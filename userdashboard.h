//
//  userdashboard.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "usermenusviewcontroller.h"
#import "PieChart.h"
#import "Applicant.h"
#import "Service.h"
@interface userdashboard : UIViewController <ServiceProtocol>
@property (strong,nonatomic) UIButton *menubutton;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (strong,atomic) NSMutableDictionary *data;
@property (strong,atomic) NSMutableArray *skills;
@property (strong,atomic) Applicant *_Applicant;
@property (strong, nonatomic)usermenusviewcontroller *userview;
@property (strong, nonatomic) IBOutlet UILabel *Percentage_potential;
@property (nonatomic,strong) IBOutlet PieChart *Chart;
@property (strong, nonatomic) IBOutlet UILabel *Percentage_Applied;
@property (weak, nonatomic) IBOutlet UILabel *major;
@property (weak, nonatomic) IBOutlet UIView *Grey;
@property (strong, nonatomic) IBOutlet UITableView *SkillTable;
@property (strong, nonatomic) IBOutlet UIView *magenda;
@property (nonatomic,strong) Service* service;

@end
