//
//  ServerModel.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/12/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerModel : NSObject 

@end
@protocol serverCompleteDelegate
-(void) finished;
@end