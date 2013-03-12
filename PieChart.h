//
//  PieChart.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/11/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PieChart : UIView{
}

@property(nonatomic,strong) NSNumber* PieData;

-(void)initWithPieData:(NSNumber*) PieData;

@end