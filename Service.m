//
//  Service.m
//  iosChallenge
//
//  Created by Roshan Balaji Nindrai SenthilNathan on 3/12/13.
//  Copyright (c) 2013 Roshan Balaji Nindrai SenthilNathan. All rights reserved.
//

#import "Service.h"
#import "Const.h"

@implementation Service
@synthesize requireddata;
@synthesize delegate;

-(void)MakeCall:(NSMutableDictionary *)requestdata
        ConnectionString :(NSString *) ConnectionString       {

    NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:ConnectionString]                                                   cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                        timeoutInterval:60.0];
    NSString *params = @"";
    for (NSString* key in [requestdata allKeys]) {
        params = [NSString stringWithFormat:@"%@%@=%@&",params,key,[requestdata objectForKey:key]];
    }
    NSLog(@"%@",ConnectionString);
   
    [theRequest setHTTPMethod:@"POST"] ;
    [theRequest setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if (theConnection) {
        // Create the NSMutableData to hold the received data.
        // requireddata is an instance variable declared elsewhere.
        requireddata = [NSMutableData data];
        NSLog(@"%@",requireddata);
    } else {
        // Inform the user that the connection failed.
        NSLog(@"Not Recieved");
    }
    
    
    
   }
-(void)connection:(NSURLConnection *)connection didReceiveResponse:
(NSURLResponse *)response
{
    // Discard all previously received data.
    NSLog( @"Response Recieved");
    requireddata = [[NSMutableData alloc] init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:
(NSData *)data
{
    // Append the new data to the receivedData.
   
    [requireddata appendData:data];
     NSLog( @"Succeeded! Received %d bytes of data", [requireddata length] );
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"done");
    if([requireddata length]>0){
        // Connection succeeded in downloading the request.
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:requireddata options:0 error:nil];
        // call the delegate after the service call is done
        [self.delegate ServiceRequestComplete:data serviceStatus:SUCCESS];
    }else{
        [self.delegate ServiceRequestComplete:nil serviceStatus:FAILURE];
    }
    
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

@end
