//
//  CoffeeListTableViewController.m
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "CoffeeListTableViewController.h"
#import "CoffeeCustomTableViewCell.h"
#import "CoffeeObject.h"
#import "NetworkConnectivity.h"

@interface CoffeeListTableViewController() {
    NSArray *arrayWithReturnedCoffeeObjects;
    CoffeeCustomTableViewCell *tableViewCellCustom;
}

@property (nonatomic) NetworkConnectivity *instanceNetworkConnectivity;

@end

@implementation CoffeeListTableViewController

#pragma mark - View Controller Lifecycle Methods
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    
    // Class method that connects API key for server authorization
    self.instanceNetworkConnectivity = [NetworkConnectivity methodCreateInstanceWithHTTPAuthorization];
    
    //Registers class for table view
    [self.tableView registerClass:[CoffeeCustomTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //Created weak reference to self (to use in block)
    __weak CoffeeListTableViewController *weakVersionOfThisClass = self;

    // Retrieves & Parses JSON on back thread, returns data on main thread
    [self.instanceNetworkConnectivity methodGetCoffeeList:^(NSArray *arrayWithCoffeeObjects) {
      //  NSLog(@"%@", arrayWithCoffeeObjects);

        arrayWithReturnedCoffeeObjects = arrayWithCoffeeObjects;

        [weakVersionOfThisClass.tableView reloadData];
        
    }];

    
}


#pragma mark - Table View Cell DataSource Methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    tableViewCellCustom = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //Prevents that weird grey appearance when cell is clicked
    tableViewCellCustom.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (tableViewCellCustom == nil){
        tableViewCellCustom = [[CoffeeCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [tableViewCellCustom methodSetupAll:arrayWithReturnedCoffeeObjects[indexPath.row]];
    return tableViewCellCustom;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (arrayWithReturnedCoffeeObjects == 0) {
        return 0;
    }
    return [arrayWithReturnedCoffeeObjects count];
}

#pragma mark - Table View Cell Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CoffeeCustomTableViewCell *tvcC = [CoffeeCustomTableViewCell new];

    return [tvcC methodReturnTableViewCellSize:arrayWithReturnedCoffeeObjects[indexPath.row]];
}














@end
