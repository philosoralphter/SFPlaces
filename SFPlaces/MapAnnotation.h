//
//  MapAnnotation.h
//  SFPlaces
//
//  Created by Ralph Samuel on 4/24/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation>

@property (nonatomic, copy)  NSString *name;

@property (nonatomic, copy)  NSString *imgPath;
@property (nonatomic, copy)  NSString *thumbPath;
@property (nonatomic, copy)  NSString *imgTitle;
@property (nonatomic, copy)  NSString *description;
//@property (nonatomic) double latitude;
//@property (nonatomic) double longitude;

@property (nonatomic) CLLocationCoordinate2D coordinate;

-(id) initWithName: (NSString *) n description: (NSString *) d imgPath: (NSString*) imP imgTitle: (NSString*) imT thumbPath: (NSString*) thumbP latitude: (double) lat longitude: (double) lon;

@end
