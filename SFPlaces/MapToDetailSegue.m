//
//  MapToDetailSegue.m
//  SFPlaces
//
//  Created by Ralph Samuel on 4/30/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import "MapToDetailSegue.h"
#import "DetailViewController.h"

@implementation MapToDetailSegue

-(id)initWithIdentifier:(NSString *) identifier source:(UIViewController *)mapViewController destination:(UIViewController *)detailViewController{
    self = [super init];
    if(self){
        NSLog(@"got here at least");
        
    }
    return self;
}



-(void) perform {
    NSLog(@"performing segue to detail view from map");
    //[UIView transitionFromView:self.sourceViewController toView:self.destinationViewController duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight completion: NULL];
    [self.sourceViewController presentViewController:self.destinationViewController animated:YES completion:NULL];
}

@end
