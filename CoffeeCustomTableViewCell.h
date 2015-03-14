//
//  CoffeeCustomTableViewCell.h
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CoffeeObject;

@interface CoffeeCustomTableViewCell : UITableViewCell

#pragma mark - Table View Cell Creation Methods
-(void)methodSetupAll:(CoffeeObject *)coffeeObjectPassedIn;

-(CGFloat)methodReturnTableViewCellSize:(CoffeeObject *)coffeeObjectToDetermineSize;

@end
