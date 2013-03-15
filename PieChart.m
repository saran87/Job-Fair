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
@synthesize  PieDataTotal;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)initWithPieData:(NSNumber*) pieData
                       :(NSNumber*) _PieDataTotal
{
  
         [self setPieData: pieData];
         [self setPieDataTotal:_PieDataTotal];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
   
    CGContextRef context = UIGraphicsGetCurrentContext();
    int radius = self.frame.size.height;
     CGPoint center;
    center.x = (self.frame.size.width/4)+5;
    center.y = self.frame.size.height/2+8.5;
    // Set the circle outerline-colour
    CAShapeLayer *slice = [CAShapeLayer layer];
    slice.fillColor = [UIColor redColor].CGColor;
    slice.strokeColor = [UIColor blackColor].CGColor;
    slice.lineWidth = 3.0;
    CGFloat angle = 0;
     NSLog(@"HOLLA %@%@",self.PieData,self.PieDataTotal);
     CGFloat denom = ([self.PieData floatValue] /[self.PieDataTotal floatValue])* 360.0;
    denom = 180.0/ denom;
    [[UIColor yellowColor] set];
    CGContextAddArc(context, center.x, center.y, radius/3, 0.0, M_PI * 2.0, YES);
    // Draw
    CGContextFillPath(context);
    UIBezierPath *piePath = [UIBezierPath bezierPath];
    [piePath moveToPoint:center];
    [[UIColor redColor] set];
    [piePath addLineToPoint:CGPointMake(center.x + radius/3 * cosf(angle), center.y + radius/3 * sinf(angle))];

    [piePath addArcWithCenter:center radius:radius/3 startAngle:angle endAngle:2*M_PI-(M_PI/denom) clockwise:YES];
     //   [piePath addLineToPoint:center];
    [piePath closePath]; // this will automatically add a straight line to the center
    slice.path = piePath.CGPath;

    [piePath fill];
 
 }

@end
