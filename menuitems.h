//
//  menuitems.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Applicant.h"
@interface menuitems : UITableViewController
@property (strong, nonatomic)NSMutableArray *menuitems;
@property (strong,atomic) NSMutableDictionary *data;
@property (strong, atomic) Applicant *_Applicant;
@property (strong,nonatomic) UIViewController* TopViewController;
@property (strong,nonatomic) NSMutableArray* controller;
@end
