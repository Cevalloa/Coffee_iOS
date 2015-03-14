//
//  CoffeeObject.h
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface CoffeeObject : MTLModel <MTLJSONSerializing>

//Mantle reads turns JSON into these objects
@property (nonatomic) NSString *stringCoffeeName;
@property (nonatomic) NSString *stringCoffeeDescription;
@property (nonatomic) NSString *stringUrlCoffeeImage;
@property (nonatomic) NSString *stringCoffeeID;

//Used to store the current object's image
@property (nonatomic) UIImage *imageOfCoffee;


@end
