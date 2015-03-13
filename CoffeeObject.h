//
//  CoffeeObject.h
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface CoffeeObject : MTLModel <MTLJSONSerializing>

//Mantle reads turns JSON into these objects
@property (nonatomic) NSString *stringCoffeeName;
@property (nonatomic) NSString *stringCoffeeDescription;
@property (nonatomic) NSURL *urlCoffeeImage;
@property (nonatomic) NSString *stringCoffeeID;


@end
