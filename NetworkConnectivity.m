//
//  NetworkConnectivity.m
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "NetworkConnectivity.h"
#import "CoffeeObject.h"

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
-(void)methodGetCoffeeList:(void(^) (NSArray *))completion{
    NSURL *url = [[NSURL alloc] initWithString:@"https://coffeeapi.percolate.com/api/coffee/"];

    [[self.session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        NSArray *dictionaryWithData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

        NSArray *arrayOfCoffees = [MTLJSONAdapter modelsOfClass:[CoffeeObject class] fromJSONArray:dictionaryWithData error:&error];
        
        //Place back on main thread, in order to update UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error){
                completion(nil);
            }
            

            completion(arrayOfCoffees);
        });


        //Use for debugging
//       NSLog(@"Returned data %@", dictionaryWithData);
//        NSLog(@"Returned response %@", response);
   
    }] resume];
    
    
}

#pragma mark - Media Retrieval Methods
-(void)methodReturnImage:(NSString *)stringLinkingToImage completion:(void(^)(UIImage *))completion{

    if(stringLinkingToImage == nil){
        return;
    }
    
    NSURL *url = [[NSURL alloc] initWithString:stringLinkingToImage];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    //We are connecting to wikipedia.. we don't need an HTTP authorization
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *data  = [[NSData alloc] initWithContentsOfURL:location];
        UIImage *image = [[UIImage alloc] initWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(image);
        });
        
        
        
    }];
    
    [task resume];
    
}






@end
