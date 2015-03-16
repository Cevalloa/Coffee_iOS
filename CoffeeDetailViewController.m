//
//  CoffeeDetailViewController.m
//  Coffee
//
//  Created by Alex Cevallos on 3/14/15.
//  Copyright (c) 2015 AlexCevallos. All rights reserved.
//

#import "CoffeeDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "NetworkConnectivity.h"
#import "CoffeeObject.h"

@interface CoffeeDetailViewController () {
    
    //The object passed in
    CoffeeObject *coffeeObjectInUseByEntireClass;
    
}

    //UI Elements to be displayed
    @property (nonatomic) UILabel *labelWithCoffeeTitle;
    @property (nonatomic) UIView *viewWithDivider;
    @property (nonatomic) UILabel *labelWithCoffeeDescription;
    @property (nonatomic) UIImageView *imageViewWithCoffee;

    @property (nonatomic) UILabel *labelDisplaysLastEdit;  //-> JSON feed didn't return a date

@end

@implementation CoffeeDetailViewController

#pragma mark - Class Methods
+(instancetype)methodCreateDetailViewControllerWithObject:(CoffeeObject *)coffeeObject{
    return [[self alloc] initWithCoffeeDetailObject:coffeeObject];
}


-(instancetype)initWithCoffeeDetailObject:(CoffeeObject *)coffeeObject{
    self = [super init];
    
    if(self){
        
        //Sets the coffee object to be used by this entire class
        coffeeObjectInUseByEntireClass = coffeeObject;
    }
    
    return self;
}

#pragma mark - View Controller Lifecycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //Adds the logo on the top
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Logo"]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //Creates Bar Button Item In Navigation Bar
    [self methodCreateBarButtonItem];
    
    //Creates the views in the navigation controller
    [self methodCreateAllViews];
    
    //Sets the constraints for the views created
    [self methodAddConstraints];

}

#pragma mark - View Creation Methods
-(void)methodCreateAllViews{
    //Sets Title label color to #666666 (Gray - Dark) & Font family
    self.labelWithCoffeeTitle = [UILabel new];
    [self.labelWithCoffeeTitle setFont:[UIFont fontWithName:@"ArialMT" size:18.0f]];
    [self.labelWithCoffeeTitle setTextColor:[UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1]];
    self.labelWithCoffeeTitle.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelWithCoffeeTitle.text = coffeeObjectInUseByEntireClass.stringCoffeeName;
    [self.view addSubview:self.labelWithCoffeeTitle];
    
    
    //Sets divider view color to #666666 (Gray - Dark)
    self.viewWithDivider = [UIView new];
    self.viewWithDivider.backgroundColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1];
    self.viewWithDivider.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.viewWithDivider];
    
    
    //Sets Description textView color to #AAAAAA (Gray) & Font Family
    self.labelWithCoffeeDescription = [UILabel new];
    [self.labelWithCoffeeDescription setFont:[UIFont fontWithName:@"ArialMT" size:14.0f]];
    [self.labelWithCoffeeDescription setTextColor:[UIColor colorWithRed:170.0f/255.0f green:170.0f/255.0f blue:170.0f/255.0f alpha:1]];
    self.labelWithCoffeeDescription.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelWithCoffeeDescription.numberOfLines = 2;
    self.labelWithCoffeeDescription.text = coffeeObjectInUseByEntireClass.stringCoffeeDescription;
    [self.view addSubview:self.labelWithCoffeeDescription];
    
    
    
    //If an image is passed in.. use that to fill the image (means there is an image)
    if (coffeeObjectInUseByEntireClass.imageOfCoffee != nil){
        //Sets image view
        self.imageViewWithCoffee = [UIImageView new];
        self.imageViewWithCoffee.translatesAutoresizingMaskIntoConstraints = NO;
        self.imageViewWithCoffee.image = coffeeObjectInUseByEntireClass.imageOfCoffee;
        self.imageViewWithCoffee.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:self.imageViewWithCoffee];
    }
    
    
    //Sets Last Edit label color to #AAAAAA (Gray) & Font Family
    self.labelDisplaysLastEdit = [UILabel new];
    [self.labelDisplaysLastEdit setFont:[UIFont fontWithName:@"Arial-ItalicMT" size:12.0f]];
    [self.labelDisplaysLastEdit setTextColor:[UIColor colorWithRed:170.0f/255.0f green:170.0f/255.0f blue:170.0f/255.0f alpha:1]];
    self.labelDisplaysLastEdit.translatesAutoresizingMaskIntoConstraints = NO;
    self.labelDisplaysLastEdit.text = @"1 Week Ago"; //-> JSON feed doesn't return a last edit object
    [self.view addSubview:self.labelDisplaysLastEdit];
}


//Creates UIBarButtonItem in iOS 7 =<
-(void)methodCreateBarButtonItem{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10,0,70,30);
    [button setTitle:@"Share" forState:UIControlStateNormal];
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.borderWidth = 2.0f;
    
    UIBarButtonItem *barbuttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = barbuttonItem;
}

#pragma mark - Autolayout Methods
-(void)methodAddConstraints{
    
    //Will hold the views (their variable for Visual Format)
    NSMutableDictionary *dictionaryOfViews = [NSMutableDictionary dictionary];
    
    //Holds Autolayout metrics
    NSDictionary *dictionaryOfMetrics = @{@"verticalSpaceInBetween" : @15,
                                          @"horizonalSpaceToTheSides" : @20,
                                          @"horizonalSpaceToTheDividerRight" : @0,
                                          @"verticalSizeImageViewWithCoffee" : @250,
                                          };
    
    //If there is an image..
    if (coffeeObjectInUseByEntireClass.imageOfCoffee != nil){
        
 
      //Set the dictionary to hold _imageViewWithCoffee
     [dictionaryOfViews addEntriesFromDictionary:NSDictionaryOfVariableBindings(_labelWithCoffeeTitle, _viewWithDivider, _labelWithCoffeeDescription, _imageViewWithCoffee, _labelDisplaysLastEdit)];
   
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-verticalSpaceInBetween-[_labelWithCoffeeTitle]-verticalSpaceInBetween-[_viewWithDivider(1)]-verticalSpaceInBetween-[_labelWithCoffeeDescription]-verticalSpaceInBetween-[_imageViewWithCoffee(verticalSizeImageViewWithCoffee)]-verticalSpaceInBetween-[_labelDisplaysLastEdit]" options:0 metrics:dictionaryOfMetrics views:dictionaryOfViews]];
        

        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-horizonalSpaceToTheSides-[_imageViewWithCoffee]-horizonalSpaceToTheSides-|" options:0 metrics:dictionaryOfMetrics views:dictionaryOfViews]];

    }else{
        
    //We Don't need _imageViewWithCoffee
    [dictionaryOfViews addEntriesFromDictionary:NSDictionaryOfVariableBindings(_labelWithCoffeeTitle, _viewWithDivider, _labelWithCoffeeDescription, _labelDisplaysLastEdit)];
        
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-verticalSpaceInBetween-[_labelWithCoffeeTitle]-verticalSpaceInBetween-[_viewWithDivider(1)]-verticalSpaceInBetween-[_labelWithCoffeeDescription]-verticalSpaceInBetween-[_labelDisplaysLastEdit]" options:0 metrics:dictionaryOfMetrics views:dictionaryOfViews]];
        
    }
    
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-horizonalSpaceToTheSides-[_labelWithCoffeeTitle]-horizonalSpaceToTheSides-|" options:0 metrics:dictionaryOfMetrics views:dictionaryOfViews]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-horizonalSpaceToTheSides-[_viewWithDivider]-horizonalSpaceToTheDividerRight-|" options:0 metrics:dictionaryOfMetrics views:dictionaryOfViews]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-horizonalSpaceToTheSides-[_labelWithCoffeeDescription]-horizonalSpaceToTheSides-|" options:0 metrics:dictionaryOfMetrics views:dictionaryOfViews]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-horizonalSpaceToTheSides-[_labelDisplaysLastEdit]-horizonalSpaceToTheSides-|" options:0 metrics:dictionaryOfMetrics views:dictionaryOfViews]];
}
@end
