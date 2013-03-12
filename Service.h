//
//  Service.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/12/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Const.h"
#import "ServerModel.h"
@interface Service : NSObject<NSURLConnectionDataDelegate>{
    id <serverCompleteDelegate> delegate;
}
@property (weak, nonatomic) Const* consts;
@property (weak, nonatomic) NSMutableData* requireddata;
@property (retain, nonatomic) id <serverCompleteDelegate> delegate;
@end

