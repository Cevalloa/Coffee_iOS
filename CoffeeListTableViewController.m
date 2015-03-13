//
//  CoffeeListTableViewController.m
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "CoffeeListTableViewController.h"
#import "NetworkConnectivity.h"

@interface CoffeeListTableViewController()

@property (nonatomic) NetworkConnectivity *instanceNetworkConnectivity;

@end

@implementation CoffeeListTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.instanceNetworkConnectivity = [NetworkConnectivity methodCreateInstanceWithHTTPAuthorization];
    
    //Retrieves & Parses JSON on back thread, returns data on main thread
    [self.instanceNetworkConnectivity methodGetCoffeeList:^(NSArray *arrayWithCoffeeObjects) {
        
        NSLog(@"%@", arrayWithCoffeeObjects);
    }];


}


@end
