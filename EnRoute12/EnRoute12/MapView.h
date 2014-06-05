//
//  MapView.h
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "QuietSpot.h"

@interface MapView : UIView <MKMapViewDelegate>

@property (strong, nonatomic) MKMapView *mapView;

- (void)updateWithSpots:(NSArray *)qspots;

@end
