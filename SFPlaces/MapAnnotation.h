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

@property (nonatomic, copy)  NSString *title;
@property (nonatomic,copy) NSString *subTitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;
    
-(id) initWithTitle: (NSString *) t subTitle: (NSString *) s coordinate: (CLLocationCoordinate2D) c;

@end
