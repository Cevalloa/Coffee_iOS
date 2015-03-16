//
//  CoffeeListTableViewController.m
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "CoffeeListTableViewController.h"
#import "CoffeeDetailViewController.h"
#import "CoffeeCustomTableViewCell.h"
#import "NetworkConnectivity.h"
#import "CoffeeObject.h"

@interface CoffeeListTableViewController() {
    NSArray *arrayWithReturnedCoffeeObjects;
    
}

@property (nonatomic) NetworkConnectivity *instanceNetworkConnectivity;

@end

@implementation CoffeeListTableViewController

#pragma mark - View Controller Lifecycle Methods
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    [self.tableView registerClass:[CoffeeCustomTableViewCell class] forCellReuseIdentifier:@"cell"];

}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //Adds the logo on the top
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
    
    // Class method that connects API key for server authorization
    self.instanceNetworkConnectivity = [NetworkConnectivity methodCreateInstanceWithHTTPAuthorization];
    
    //Registers class for table view
    
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
    
    static NSString *cellIdentifier = @"cell";

       CoffeeCustomTableViewCell *tableViewCellCustom = [[CoffeeCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier withObject:arrayWithReturnedCoffeeObjects[indexPath.row]];

    
        //Prevents that weird grey appearance when cell is clicked
    //tableViewCellCustom.selectionStyle = UITableViewCellSelectionStyleNone;

    
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
    CoffeeCustomTableViewCell *coffeeCustomTableViewCellInstance = [CoffeeCustomTableViewCell new];

    return [coffeeCustomTableViewCellInstance methodReturnTableViewCellSize:arrayWithReturnedCoffeeObjects[indexPath.row]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CoffeeDetailViewController *coffeeObjectDetailViewController = [CoffeeDetailViewController methodCreateDetailViewControllerWithObject:arrayWithReturnedCoffeeObjects[indexPath.row]];
    
    [self.navigationController pushViewController:coffeeObjectDetailViewController animated:YES];
    
    
}







@end
