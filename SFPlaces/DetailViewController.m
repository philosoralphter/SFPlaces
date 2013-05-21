//
//  DetailViewController.m
//  SFPlaces
//
//  Created by Ralph Samuel on 4/30/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //----------
    //Populate detail view with appropriate location data:
    
    //Title bar:
	self.title = [self.selectedLocationDictionary valueForKey: @"name"];
    
    //Title Label
    self.titleLabel.text = [self.selectedLocationDictionary valueForKey: @"name"];
    
    //Image
    UIImageView *myImageView = [[UIImageView alloc] init];
    myImageView.image = [UIImage imageNamed:[self.selectedLocationDictionary valueForKey: @"imgpath"]];
    self.imageDisplayed.image = myImageView.image;
    
    //Description Text
    self.descriptionText.text = [self.selectedLocationDictionary valueForKey: @"description"];
    
    //---------------
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
