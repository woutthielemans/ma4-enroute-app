//
//  QuietSpotFactory.m
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "QuietSpotFactory.h"

@implementation QuietSpotFactory

+ (QuietSpot *)createQuietSpotWithTitle:(NSString *)title Subtitle:(NSString *)subtitle Longitude:(NSNumber *)longitude andLatitude:(NSNumber *)latitude
{
    QuietSpot *qspot = [[QuietSpot alloc] init];
    qspot.title = title;
    qspot.subtitle = subtitle;
    double lon = [longitude doubleValue];;
    double lat = [latitude doubleValue];
    qspot.coordinate = CLLocationCoordinate2DMake(lon, lat);
    return qspot;
}

@end
