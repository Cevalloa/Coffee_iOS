//
//  CoffeeObject.m
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "CoffeeObject.h"
#import "NSValueTransformer+MTLPredefinedTransformerAdditions.h"

@implementation CoffeeObject

#pragma mark - Mantle Methods
+(NSDictionary *)JSONKeyPathsByPropertyKey{
    
    return @{@"stringCoffeeName" : @"name",
             @"stringCoffeeDescription" : @"desc",
             @"stringUrlCoffeeImage" : @"image_url",
             @"stringCoffeeID" : @"id",
             };
}



@end
