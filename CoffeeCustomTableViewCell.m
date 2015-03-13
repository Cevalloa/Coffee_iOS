//
//  CoffeeCustomTableViewCell.m
//  Coffee
//
//  Created by Alex Cevallos on 3/12/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "CoffeeCustomTableViewCell.h"

@interface CoffeeCustomTableViewCell()

@property (nonatomic) UILabel *labelTitle;
@property (nonatomic) UILabel *labelShortDescription;
@property (nonatomic, weak) UIImage *imageOfCoffee;

@end

@implementation CoffeeCustomTableViewCell

#pragma mark - Table View Cell Creation Methods

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        //Sets the subviews for the tableviewcell
        [self methodAddTableViewCellSubviews];
        
    }
    
    
    return self;
}

-(void)methodAddTableViewCellSubviews{
    
    self.labelTitle = [UILabel new];
    
    //Sets color to #666666 (Gray - Dark)
    [self.labelTitle setTextColor:[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1]];
    [self.labelTitle setFont:[UIFont fontWithName:@"ArialMT" size:18.0f]];
    self.labelTitle.text = @"test one";
    
    
    self.labelShortDescription = [UILabel new];
    
    //Sets color to #AAAAAA Gray
    [self.labelShortDescription setTextColor:[UIColor grayColor]];
    [self.labelShortDescription setFont:[UIFont fontWithName:@"ArialMT" size:16.0f]];
    [self.labelShortDescription setNumberOfLines:2];
    self.labelShortDescription.text = @"test two";
    
    //Need to to this when using NSLayoutConstraints
    self.labelTitle.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelShortDescription.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    //Debugging
    self.labelTitle.backgroundColor = [UIColor greenColor];
    self.labelShortDescription.backgroundColor = [UIColor redColor];
    self.contentView.backgroundColor = [UIColor yellowColor];
    
    [self.contentView addSubview:self.labelTitle];
    [self.contentView addSubview:self.labelShortDescription];
    
    [self setNeedsUpdateConstraints];
    
    
}

#pragma mark - Auto Layout Methods

-(void)methodSetConstraintsForTableViewCell{
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_labelTitle, _labelShortDescription);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(10)-[_labelTitle]-10-[_labelShortDescription]" options:0 metrics:nil views:viewsDictionary]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[_labelTitle]-(20)-|"
                                                                 options:0 metrics:nil views:viewsDictionary]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(20)-[_labelShortDescription]-(40)-|" options:0 metrics:nil views:viewsDictionary]];
    
}

-(void)updateConstraints{
    
    [self methodSetConstraintsForTableViewCell];
    
    [super updateConstraints];
}











@end
