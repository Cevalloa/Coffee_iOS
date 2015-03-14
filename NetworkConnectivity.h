//
//  NetworkConnectivity.h
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NetworkConnectivity : NSObject

#pragma mark Class Alloc & Init methods
+(instancetype)methodCreateInstanceWithHTTPAuthorization;

#pragma mark - Web Server Data Retrieval Methods
-(void)methodGetCoffeeList:(void(^)(NSArray *arrayWithCoffeeObjects))completion;

#pragma mark - Media Retrieval Methods
-(void)methodReturnImage:(NSString *)stringLinkingToImage completion:(void(^)(UIImage *))completion;


@end
