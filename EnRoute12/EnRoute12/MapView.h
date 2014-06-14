//
//  MapView.h
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "QuietSpot.h"
#import "BudaSpot.h"

@interface MapView : UIView <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) BudaSpot *budascoop;
@property (strong, nonatomic) BudaSpot *budafabriek;
@property (strong, nonatomic) BudaSpot *budatoren;
@property (strong, nonatomic) BudaSpot *budalab;

- (void)updateWithSpots:(NSArray *)qspots;

@end
