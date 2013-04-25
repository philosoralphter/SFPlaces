//
//  FirstViewController.h
//  SFPlaces
//
//  Created by Ralph Samuel on 4/19/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FirstViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;



@end
