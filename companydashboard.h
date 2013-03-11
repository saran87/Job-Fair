//
//  companydashboard.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/9/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface companydashboard : UIViewController
@property (strong,nonatomic) UIButton *menubutton;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong,nonatomic) NSDictionary *data;

@end
