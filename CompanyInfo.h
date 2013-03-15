//
//  CompanyInfo.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//
#import "Applicant.h"
#import <UIKit/UIKit.h>
#import "Service.h"
@interface CompanyInfo : UIViewController
@property (strong,nonatomic) UIButton *menubutton;
@property (strong, nonatomic) IBOutlet UILabel *MenuTittle;
@property (strong,nonatomic) NSMutableArray *data;
@property (strong, nonatomic) IBOutlet UIButton *Enque;
@property (strong, nonatomic) Service *service;
@property (strong, nonatomic) NSMutableDictionary *_Applicant;
@property (strong, nonatomic) IBOutlet UILabel *jobtitle;
@property (strong, nonatomic) IBOutlet UILabel *jobdescription;
@property (strong, nonatomic) IBOutlet UILabel *city;
@property (strong, nonatomic) IBOutlet UILabel *quarter;
@property (strong, nonatomic) IBOutlet UILabel *salary;
@property (strong, nonatomic) IBOutlet UILabel *gpa;
@property (strong, nonatomic) IBOutlet UILabel *Address;
@property (strong, nonatomic) IBOutlet UIImageView *bground;
@property (strong, nonatomic) IBOutlet UIButton *queue;
- (IBAction)queue:(id)sender;

- (IBAction)Apply:(id)sender;

@end
