//
//  CoffeeDetailViewController.m
//  Coffee
//
//  Created by Alex Cevallos on 3/14/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "CoffeeDetailViewController.h"
#import "CoffeeObject.h"

@interface CoffeeDetailViewController () {
    
    //The object passed in
    CoffeeObject *coffeeObjectInUseByEntireClass;
}


@end

@implementation CoffeeDetailViewController

#pragma mark - Class Methods
+(instancetype)methodCreateDetailViewControllerWithObject:(CoffeeObject *)coffeeObject{
    return [[self alloc] initWithCoffeeDetailObject:coffeeObject];
}


-(instancetype)initWithCoffeeDetailObject:(CoffeeObject *)coffeeObject{
    self = [super init];
    
    if(self){
        coffeeObjectInUseByEntireClass = coffeeObject;
    }
    
    return self;
}

#pragma mark - View Controller Lifecycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"The current object's name is.. %@", coffeeObjectInUseByEntireClass.stringCoffeeName);
}


@end
