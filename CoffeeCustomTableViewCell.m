//
//  CoffeeCustomTableViewCell.m
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "CoffeeCustomTableViewCell.h"
#import "NetworkConnectivity.h"

@interface CoffeeCustomTableViewCell() {
    CoffeeObject *coffeeObjectCurrentlyInUseByEntireClass;
}

@property (nonatomic) UILabel *labelTitle;
@property (nonatomic) UILabel *labelShortDescription;
@property (nonatomic) UIImageView *imageOfCoffee;

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


-(void)setupAll:(CoffeeObject *)coffeeObjectPassedIn{
    coffeeObjectCurrentlyInUseByEntireClass = coffeeObjectPassedIn;
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
    [self.labelShortDescription setFont:[UIFont fontWithName:@"ArialMT" size:16.0f]];
    [self.labelShortDescription setNumberOfLines:2];
    self.labelShortDescription.text = coffeeObjectCurrentlyInUseByEntireClass.stringCoffeeDescription;
    
    self.imageOfCoffee = [UIImageView new];

    
    //Need to to this when using NSLayoutConstraints
    self.labelTitle.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelShortDescription.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageOfCoffee.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    //Debugging
    self.labelTitle.backgroundColor = [UIColor greenColor];
    self.labelShortDescription.backgroundColor = [UIColor redColor];
    self.imageOfCoffee.backgroundColor = [UIColor purpleColor];
    
    if (self.imageOfCoffee.image == nil){
        NetworkConnectivity *networkConnectivity = [NetworkConnectivity new];
        
        
        //Used to use 'self' in a block
        __weak CoffeeCustomTableViewCell *weakVersionOfSelf = self;
        
        [networkConnectivity methodReturnImage:coffeeObjectCurrentlyInUseByEntireClass.stringUrlCoffeeImage completion:^(UIImage *image) {
            
            //Stores the image
            coffeeObjectCurrentlyInUseByEntireClass.imageOfCoffee = image;
            
            weakVersionOfSelf.imageOfCoffee.image = image;
        }];
    }else{
        self.imageOfCoffee.image = coffeeObjectCurrentlyInUseByEntireClass.imageOfCoffee;
        
    }
    self.contentView.backgroundColor = [UIColor yellowColor];
    
    [self.contentView addSubview:self.labelTitle];
    [self.contentView addSubview:self.labelShortDescription];
    [self.contentView addSubview:self.imageOfCoffee];
    
    [self setNeedsUpdateConstraints];
    
    
}

#pragma mark - Auto Layout Methods

-(void)updateConstraints{
    
    [self methodSetConstraintsForTableViewCell];
    
    [super updateConstraints];
}

-(void)methodSetConstraintsForTableViewCell{
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_labelTitle, _labelShortDescription, _imageOfCoffee);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(10)-[_labelTitle]-10-[_labelShortDescription]-10-[_imageOfCoffee(200)]" options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[_labelTitle]-(20)-|"
                                                                 options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[_labelShortDescription]-(40)-|" options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[_imageOfCoffee]-(20)-|" options:0 metrics:nil views:viewsDictionary]];
    
}













@end
