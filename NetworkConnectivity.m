//
//  NetworkConnectivity.m
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "NetworkConnectivity.h"

@interface NetworkConnectivity()

@property (nonatomic) NSURLSession *session;

@end

@implementation NetworkConnectivity

#pragma mark Class Alloc & Init methods
+(instancetype)methodCreateInstanceWithHTTPAuthorization{
    return [[self alloc] initWithHTTPAuthorization];
}

-(instancetype)initWithHTTPAuthorization{
    self = [super init];
    
    if(self){
        [self methodSetAuthorizationHTTPHeader];
    }
    
    return self;
}

#pragma mark - Web Server Authentication Methods
-(void)methodSetAuthorizationHTTPHeader{
    
    //Sets the authorization for the session.
    NSURLSessionConfiguration *urlSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    [urlSessionConfiguration setHTTPAdditionalHeaders:@{@"Authorization" : @"WuVbkuUsCXHPx3hsQzus4SE"}];
    
    //All sessions in modal layer should use this session
    self.session = [NSURLSession sessionWithConfiguration:urlSessionConfiguration];
    
}

#pragma mark - Web Server Data Retrieval Methods
-(void)methodGetCoffeeList{
    NSURL *url = [[NSURL alloc] initWithString:@"https://coffeeapi.percolate.com/api/coffee/"];

    [[self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *dictionaryWithData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        NSLog(@"Returned data %@", dictionaryWithData);
        NSLog(@"Returned response %@", response);
        
    }] resume];
    
    
}

@end
