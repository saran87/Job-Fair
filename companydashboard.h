//
//  companydashboard.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Service.h"
#import "Organization.h"
#import "PieChart.h"
@interface companydashboard : UIViewController <UITableViewDelegate>
@property (strong,nonatomic) UIButton *menubutton;
@property (strong, nonatomic) IBOutlet UIButton *company;
@property (strong,nonatomic) NSDictionary *data;
@property (strong, nonatomic) IBOutlet UILabel *Date;
@property (strong, nonatomic) IBOutlet UIView *gray;
@property (strong, nonatomic) IBOutlet UIView *magenda;
@property (nonatomic,strong) Service* service;
@property (strong,atomic) Organization *organization;
@property (strong,atomic) NSMutableArray*skills;
@property (nonatomic,strong) IBOutlet PieChart *Chart;
@property (strong, nonatomic) IBOutlet UILabel *totalvalue;
@property (strong, nonatomic) IBOutlet UITableView *SkillTable;
- (IBAction)HyperLink:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *appliedValue;
@end
