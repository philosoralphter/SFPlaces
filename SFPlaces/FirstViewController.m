//
//  FirstViewController.m
//  SFPlaces
//
//  Created by Ralph Samuel on 4/19/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self. mapView.delegate = self;
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    
    
    //Show User Location
    [self.mapView setShowsUserLocation:YES];
   
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //center on user location once received:
    //must test to see whether this is called again as soon as it changes or what
    //(we only want this called when the app first opens if at all)
    MKCoordinateRegion currentRegion = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 9000, 9000);
    [self.mapView setRegion:currentRegion animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
