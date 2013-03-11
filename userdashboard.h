//
//  userdashboard.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "usermenusviewcontroller.h"
@interface userdashboard : UIViewController
@property (strong,nonatomic) UIButton *menubutton;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong,atomic) NSDictionary *data;
@property (strong, nonatomic)usermenusviewcontroller *userview;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *role;
@property (strong, nonatomic)UITableView *table;
@end
