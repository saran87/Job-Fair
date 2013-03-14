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
@property (strong,nonatomic) NSMutableDictionary *data;
@property (strong, nonatomic) Service *service;
@property (strong, nonatomic) Applicant *_Applicant;
- (IBAction)Back:(id)sender;
@end
