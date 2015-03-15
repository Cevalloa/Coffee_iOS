//
//  CoffeeDetailViewController.h
//  Coffee
//
//  Created by Alex Cevallos on 3/14/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CoffeeObject;

@interface CoffeeDetailViewController : UIViewController

#pragma mark - Class Methods
+(instancetype)methodCreateDetailViewControllerWithObject:(CoffeeObject *)coffeeObject;

@end
