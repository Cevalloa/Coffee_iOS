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

@interface CoffeeListTableViewController()

@property (nonatomic) NetworkConnectivity *instanceNetworkConnectivity;

@end

@implementation CoffeeListTableViewController

#pragma mark - View Controller Lifecycle Methods
-(void)viewDidLoad{
    [super viewDidLoad];
    
    //Class method that connects API key for server authorization
 //   self.instanceNetworkConnectivity = [NetworkConnectivity methodCreateInstanceWithHTTPAuthorization];
    
    //Retrieves & Parses JSON on back thread, returns data on main thread
//    [self.instanceNetworkConnectivity methodGetCoffeeList:^(NSArray *arrayWithCoffeeObjects) {
//        NSLog(@"%@", arrayWithCoffeeObjects);
//    }];
    [self.tableView registerClass:[CoffeeCustomTableViewCell class] forCellReuseIdentifier:@"cell"];

}

#pragma mark - Table View Cell DataSource Methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CoffeeCustomTableViewCell *tableViewCellCustom = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if(!tableViewCellCustom){
        tableViewCellCustom = [[CoffeeCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return tableViewCellCustom;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

#pragma mark - Table View Cell Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300.0f;
}














@end
