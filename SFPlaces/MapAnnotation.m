//
//  MapAnnotation.m
//  SFPlaces
//
//  Created by Ralph Samuel on 4/24/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation



-(id)initWithDictionary: (NSDictionary*) sourceDict{
    self.sourceDictionary = sourceDict;
    
    self = [self initWithName: [sourceDict valueForKey:@"name"] description:[sourceDict valueForKey:@"description"] imgPath: NULL imgTitle:NULL thumbPath:NULL latitude:[[sourceDict valueForKey:@"latitude"]doubleValue] longitude: [[sourceDict valueForKey:@"longitude"]doubleValue]];
    
    return self;
}

-(id) initWithName:(NSString *)n description:(NSString *)d imgPath:(NSString *)imP imgTitle:(NSString *)imT thumbPath:(NSString *)thumbP latitude:(double)lat longitude:(double)lon{
    
    self.name = n;
    self.description = d;
    self.imgPath = imP;
    self.imgTitle = imT;
    self.thumbPath = thumbP;
    
    CLLocationCoordinate2D inputCoordinate;
    inputCoordinate.latitude = lat;
    inputCoordinate.longitude = lon;
    self.coordinate = inputCoordinate;
    
    return self;
}

-(NSString*) title {
    return self.name;
}

@end
