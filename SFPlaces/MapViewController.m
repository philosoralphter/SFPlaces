//
//  FirstViewController.m
//  SFPlaces
//
//  Created by Ralph Samuel on 4/19/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import "MapViewController.h"
#import "MapToDetailSegue.h"
#import "DetailViewController.h"


@interface MapViewController ()


@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];    
    self. mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    
    
    //Show User Location
    [self.mapView setShowsUserLocation:YES];
   
    //-------
    //create MapAnnotations from locations NSDictionaries
    //and add them all to map
    //-------
    
    //gain access to locationsArray in AppDelegate
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //create custom MapAnotations using custom init method
    for (NSDictionary* item in appDelegate.locationsArray){
        MapAnnotation* annotation = [[MapAnnotation alloc] initWithDictionary: item];
        
        [self.mapView addAnnotation:annotation];
        
        MKCoordinateRegion currentRegion = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 10000, 10000);
        [self.mapView setRegion:currentRegion animated:YES];

    }
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //center on user location once received:
    //---
    //must test to see whether this is called again as soon as it changes or what
    //(we only want this called when the app first opens if at all)
    //---
    MKCoordinateRegion currentRegion = MKCoordinateRegionMakeWithDistance(self.mapView.userLocation.coordinate, 10000, 10000);
    [self.mapView setRegion:currentRegion animated:YES];
}


- (MKAnnotationView *)mapView: (MKMapView *) mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    //---------
    //
    //this method is called when an annotation is added to the map I believe
    //so once i am comfortable with everything that is going on, I will be adding
    //the logic here to correctly identify and reuse the annotations, etc.
    //-------
    
    //if annotation passed is User location, return nil
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    //if annotation has title, create it
    if (annotation.title){
        
        // If an existing pin view was not available, create one.
        //(creates one anyway right now just for examplary purposes)
        MKPinAnnotationView* customPinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
        customPinView.pinColor = MKPinAnnotationColorGreen;
        customPinView.animatesDrop = YES;
        
        //Add right callout button to custom pinView for segue to detail view
        //when pushed, calls mapView:annotationView:calloutAccessoryControlTapped:
        customPinView.canShowCallout = YES;
        customPinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        
        //if coming to map from detail view, have appropriate annotation selected
        if([annotation.title isEqualToString:[self.dictionaryOfSelectedAnnotation valueForKey:@"name"]]){
            [customPinView setSelected: YES animated: YES];
        }
        
        return customPinView;
    }
    return nil;
}


-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    //--------
    //method to trigger segue from map view to detail view
    //called when moreInfoButton pushed from an annotation
    //--------
    NSLog(@"moreInfoButton pushed!!!!");
    
    //*******
    //Find and save the NSDictionary object of the location for the selected annotation to give to the detail view controller
    
    //gain access to locationsArray in AppDelegate:
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //loop through dictionaries to find identifier match and set to class property for passing to detail view
    for (NSDictionary* item in appDelegate.locationsArray){
        if ([[item valueForKey:@"name"] isEqualToString: view.annotation.title]){
            self.dictionaryOfSelectedAnnotation = item;
        }
    }
    //*********
    
    [self performSegueWithIdentifier: @"mapToDetailView" sender:self];
 
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    DetailViewController* detail = segue.destinationViewController;
    
    // Give the detail view controller the NSDictionary object of the location for the selected annotation
    detail.selectedLocationDictionary = self.dictionaryOfSelectedAnnotation;
}

- (IBAction)unwindFromDetail:(UIStoryboardSegue *)segue {
    //------------
    //Method brings back to map view from detail view
    //triggered when back to map button pushed in detail view
    //specifically just before the segue is performed so:
    //
    //TODO: logic to determine which specific location
    //sent it so as to have that annotation on map and selected
    //------------
    //segue.identifier
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
