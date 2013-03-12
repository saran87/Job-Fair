//
//  Job.h
//  iosChallenge
//
//  Created by Saravana Kumar on 3/11/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Job : NSObject{
    
    int _jobId;
    NSString* _postion;
    NSString* _description;
    NSString* _companyProfile;
    bool _status;
}

@end
