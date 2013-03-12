//
//  PieChart.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/11/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "PieChart.h"
#import <QuartzCore/QuartzCore.h>
@implementation PieChart
@synthesize  PieData;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)initWithPieData:(NSNumber*) pieData
{
  
         [self setPieData: pieData];
        NSLog(@"Hello%f",[self.PieData floatValue]);
        NSLog(@"%@",self);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
    NSLog(@"Object Address%f",[self.PieData floatValue]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    int radius = self.frame.size.height;
    NSLog(@"%i",radius);
    CGPoint center;
    center.x = (self.frame.size.width/4);
    center.y = self.frame.size.height/2;
    // Set the circle outerline-colour
    CAShapeLayer *slice = [CAShapeLayer layer];
    slice.fillColor = [UIColor redColor].CGColor;
    slice.strokeColor = [UIColor blackColor].CGColor;
    slice.lineWidth = 3.0;
    CGFloat angle = 0;
    NSLog(@"%f",[self.PieData floatValue]);
     NSLog(@"%@",self);
    CGFloat denom = ([self.PieData floatValue] /100)* 360.0;
    denom = 180.0/ denom;
    [[UIColor blackColor] set];
    CGContextAddArc(context, center.x, center.y, radius/3, 0.0, M_PI * 2.0, YES);
    // Draw
    CGContextFillPath(context);
    UIBezierPath *piePath = [UIBezierPath bezierPath];
    [piePath moveToPoint:center];
    [[UIColor orangeColor] set];
    [piePath addLineToPoint:CGPointMake(center.x + radius/3 * cosf(angle), center.y + radius/3 * sinf(angle))];

    [piePath addArcWithCenter:center radius:radius/3 startAngle:angle endAngle:2*M_PI-(M_PI/denom) clockwise:YES];

    //   [piePath addLineToPoint:center];
    [piePath closePath]; // this will automatically add a straight line to the center
    slice.path = piePath.CGPath;

    [piePath fill];
 
 }

@end
