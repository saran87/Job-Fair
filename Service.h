//
//  Service.h
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/12/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Const.h"
#import "ServiceProtocol.h"
@interface Service : NSObject<NSURLConnectionDataDelegate>{
   
}
@property (strong, nonatomic) NSMutableData* requireddata;
@property (nonatomic, assign) id<ServiceProtocol> delegate;

-(void)MakeCall:(NSMutableDictionary *)requestdata
              ConnectionString :(NSString *) ConnectionString;

@end

