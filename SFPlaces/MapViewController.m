//
//  FirstViewController.m
//  SFPlaces
//
//  Created by Ralph Samuel on 4/19/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import "MapViewController.h"


@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self. mapView.delegate = self;
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    
    
    //Show User Location
    [self.mapView setShowsUserLocation:YES];
    
    //---------
    //show example Annotation location pin
    //-------
    
    //create location object
    CLLocationCoordinate2D mockLocation1;
    mockLocation1.latitude = 37.774989;
    mockLocation1.longitude = -122.438421;
    
    //create and add annotation
    MapAnnotation *mapAnnotation = [[MapAnnotation alloc]initWithTitle:@"Example Annotation: The Bag" subTitle: @"Example Annotation" coordinate: mockLocation1];
    [self.mapView addAnnotation:mapAnnotation];
    
    //----------
    
    
    
    
    //---------
    //show example customized annotation
    //preparation (of annatation object) here, implementation inside mapView:viewForAnnotation:
    //-------
    
    //create location object/annotation
    CLLocationCoordinate2D mockLocation2;
    mockLocation2.latitude = 37.763658;
    mockLocation2.longitude = -122.477217;
    MapAnnotation *mapAnnotation2 = [[MapAnnotation alloc]initWithTitle:@"Expanded Annotation" subTitle: @"The Set" coordinate: mockLocation2];
    [self.mapView addAnnotation:mapAnnotation2];
    
   
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //center on user location once received:
    //---
    //must test to see whether this is called again as soon as it changes or what
    //(we only want this called when the app first opens if at all)
    //---
    MKCoordinateRegion currentRegion = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 9000, 9000);
    [self.mapView setRegion:currentRegion animated:YES];
}

-(MKAnnotationView *)mapView: (MKMapView *) mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //---------
    //show example customized annotation
    //implemented here.
    //
    //this method is called when an annotation is added to the map I believe
    //so once i am comfortable with everything that is going on, I will be adding
    //the logic here to correctly identify and reuse the annotations, etc.
    //-------
    
    //if annotation passed is User location, return nil
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    //only create for "expanded notation"
    if ([annotation.title isEqual: @"Expanded Annotation"]){
        
        // If an existing pin view was not available, create one.
        //(creates one anyway right now just for examplary purposes)
        MKPinAnnotationView* customPinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
        customPinView.pinColor = MKPinAnnotationColorGreen;
        customPinView.animatesDrop = YES;
        customPinView.canShowCallout = YES;
        
        //Add right callout button to custom pinView for more details:
        UIButton *moreInfoButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        customPinView.rightCalloutAccessoryView = moreInfoButton;
        
        return customPinView;
    }
    return nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
