//
//  MapAnnotation.m
//  SFPlaces
//
//  Created by Ralph Samuel on 4/24/13.
//  Copyright (c) 2013 Ralph Samuel. All rights reserved.
//

#import "MapAnnotation.h"

@implementation MapAnnotation

-(id) initWithTitle:(NSString *) t subTitle: (NSString*) s coordinate:(CLLocationCoordinate2D) c
{
    self.title = t;
    self.subTitle = s;
    self.coordinate = c;
    return self;
}

@end
