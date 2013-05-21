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
#import "MapAnnotation.h"
#import "AnnotationView.h"
#import "AppDelegate.h"


@interface MapViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic)NSDictionary *dictionaryOfSelectedAnnotation;

//gain access to locationsArray in AppDelegate
@property (strong, nonatomic) AppDelegate *appDelegate;


- (IBAction)unwindFromDetail:(UIStoryboardSegue *)segue;

@end
