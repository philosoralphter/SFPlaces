//
//  DetailViewController.h
//  SFPlaces
//
//  Created by Ralph Samuel on 4/30/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface DetailViewController :UIViewController


@property NSDictionary *selectedLocationDictionary;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UIImageView *imageDisplayed;

@end
