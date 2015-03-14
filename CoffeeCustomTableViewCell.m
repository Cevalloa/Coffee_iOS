//
//  CoffeeCustomTableViewCell.m
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "CoffeeCustomTableViewCell.h"
#import "NetworkConnectivity.h"
#import "CoffeeObject.h"

@interface CoffeeCustomTableViewCell() {
    CoffeeObject *coffeeObjectCurrentlyInUseByEntireClass;
}

@property (nonatomic) UILabel *labelTitle;
@property (nonatomic) UILabel *labelShortDescription;
@property (nonatomic) UIImageView *imageOfCoffeeInTableViewCell;

@end

@implementation CoffeeCustomTableViewCell


#pragma mark - Table View Cell Creation Methods
//Called automatically by cell creation
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
    }
    
    
    return self;
}


-(void)methodSetupAll:(CoffeeObject *)coffeeObjectPassedIn{
    
    //Adds the accessory view for each cell
    self.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    //Sets passed in object to the current coffee object
    coffeeObjectCurrentlyInUseByEntireClass = coffeeObjectPassedIn;
    
    //Adds the table view cell's subviews
    [self methodAddTableViewCellSubviews];
}

-(void)methodAddTableViewCellSubviews{
    
    self.labelTitle = [UILabel new];
    
    //Sets color to #666666 (Gray - Dark)
    [self.labelTitle setTextColor:[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1]];
    [self.labelTitle setFont:[UIFont fontWithName:@"ArialMT" size:18.0f]];
    self.labelTitle.text = coffeeObjectCurrentlyInUseByEntireClass.stringCoffeeName;
    
    
    self.labelShortDescription = [UILabel new];
    
    //Sets color to #AAAAAA Gray
    [self.labelShortDescription setTextColor:[UIColor grayColor]];
    [self.labelShortDescription setFont:[UIFont fontWithName:@"ArialMT" size:14.0f]];
    [self.labelShortDescription setNumberOfLines:2];
    self.labelShortDescription.text = coffeeObjectCurrentlyInUseByEntireClass.stringCoffeeDescription;
    
    //Creates image to display coffee (if there is one)
    self.imageOfCoffeeInTableViewCell = [UIImageView new];
    self.imageOfCoffeeInTableViewCell.contentMode = UIViewContentModeScaleAspectFit;

    
    //Need to to this when using NSLayoutConstraints
    self.labelTitle.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelShortDescription.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageOfCoffeeInTableViewCell.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    //Debugging
    self.labelTitle.backgroundColor = [UIColor greenColor];
    self.labelShortDescription.backgroundColor = [UIColor redColor];
    self.imageOfCoffeeInTableViewCell.backgroundColor = [UIColor purpleColor];
    
    if (self.imageOfCoffeeInTableViewCell.image == nil){
        NetworkConnectivity *networkConnectivity = [NetworkConnectivity new];
        
        
        //Used to use 'self' in a block
        __weak CoffeeCustomTableViewCell *weakVersionOfSelf = self;
        
        [networkConnectivity methodReturnImage:coffeeObjectCurrentlyInUseByEntireClass.stringUrlCoffeeImage completion:^(UIImage *image) {
            
            //Stores the image
            coffeeObjectCurrentlyInUseByEntireClass.imageOfCoffee = image;
            
            weakVersionOfSelf.imageOfCoffeeInTableViewCell.image = image;
        }];
    }else{
        self.imageOfCoffeeInTableViewCell.image = coffeeObjectCurrentlyInUseByEntireClass.imageOfCoffee;
        
    }
    self.contentView.backgroundColor = [UIColor yellowColor];
    
    [self.contentView addSubview:self.labelTitle];
    [self.contentView addSubview:self.labelShortDescription];
    [self.contentView addSubview:self.imageOfCoffeeInTableViewCell];
    
    [self setNeedsUpdateConstraints];
    
    
}

#pragma mark - Auto Layout Methods

-(void)updateConstraints{
    
    //Sets the constraints for the images
    [self methodSetConstraintsForTableViewCell];
    
    [super updateConstraints];
}

-(void)methodSetConstraintsForTableViewCell{
    NSDictionary *dictionaryOfViews = NSDictionaryOfVariableBindings(_labelTitle, _labelShortDescription, _imageOfCoffeeInTableViewCell);

    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(10)-[_labelTitle]-10-[_labelShortDescription]-10-[_imageOfCoffeeInTableViewCell]-10-|" options:0 metrics:nil views:dictionaryOfViews]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[_labelTitle]-(20)-|"
                                                                 options:0 metrics:nil views:dictionaryOfViews]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[_labelShortDescription]-(40)-|" options:0 metrics:nil views:dictionaryOfViews]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[_imageOfCoffeeInTableViewCell]-(30)-|" options:0 metrics:nil views:dictionaryOfViews]];
    
}

#pragma mark - Table View Cell Size methods
-(CGFloat)methodReturnTableViewCellSize:(CoffeeObject *)coffeeObjectToDetermineSize{
    
    //If there is a URL, the cell should be big enough to fit it
    if (coffeeObjectToDetermineSize.stringUrlCoffeeImage.length > 0){
        return 250.0f;
    }
    
    // No image? Only enough space for the title & description
    return 92.5f;
    
    
    
}












@end
