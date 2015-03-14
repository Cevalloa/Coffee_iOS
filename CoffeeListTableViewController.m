//
//  CoffeeListTableViewController.m
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "CoffeeListTableViewController.h"
#import "CoffeeCustomTableViewCell.h"
#import "NetworkConnectivity.h"

@interface CoffeeListTableViewController() {
    NSArray *arrayWithReturnedCoffeeObjects;
}

@property (nonatomic) NetworkConnectivity *instanceNetworkConnectivity;

@end

@implementation CoffeeListTableViewController

#pragma mark - View Controller Lifecycle Methods
-(void)viewWillAppear:(BOOL)animated{
    // Class method that connects API key for server authorization
    self.instanceNetworkConnectivity = [NetworkConnectivity methodCreateInstanceWithHTTPAuthorization];
    [self.tableView registerClass:[CoffeeCustomTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    // Retrieves & Parses JSON on back thread, returns data on main thread
    [self.instanceNetworkConnectivity methodGetCoffeeList:^(NSArray *arrayWithCoffeeObjects) {
        NSLog(@"%@", arrayWithCoffeeObjects);
        arrayWithReturnedCoffeeObjects =arrayWithCoffeeObjects;
        [self.tableView reloadData];
        
    }];

    
}

#pragma mark - Table View Cell DataSource Methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CoffeeCustomTableViewCell *tableViewCellCustom = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    tableViewCellCustom.selectionStyle = UITableViewCellSelectionStyleNone;
    if (tableViewCellCustom == nil){
        tableViewCellCustom = [[CoffeeCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [tableViewCellCustom setupAll:arrayWithReturnedCoffeeObjects[indexPath.row]];

    return tableViewCellCustom;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayWithReturnedCoffeeObjects count];
}

#pragma mark - Table View Cell Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300.0f;
}














@end
