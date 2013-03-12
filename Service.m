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
@synthesize consts;
@synthesize requireddata;

-(void)ConnectonforLoginwith:(NSMutableDictionary *)requestdata
                            :(NSString *) ConnectionString       {
    NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:ConnectionString]                                                   cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                        timeoutInterval:60.0];
    NSString *params = [[NSString alloc]initWithString:ConnectionString];
    for (NSString* key in requestdata) {
        NSLog(@"%@",key);
        params = [NSString stringWithFormat:@"%@%@=%@",params,key,[requestdata objectForKey:key]];
    }
   
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
    NSLog( @"Succeeded! Received bytes of data");
    NSLog(@"%@",response.URL);
    [requireddata setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:
(NSData *)data
{
    // Append the new data to the receivedData.
    // NSLog( @"Succeeded! Received bytes of data");
    [requireddata appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Connection succeeded in downloading the request.
    NSLog( @"Succeeded! Received %d bytes of data", [requireddata length] );
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:requireddata options:0 error:nil];
    [delegate finished];
    
}

@end
