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
#import "Teacher.h"
#import "MapDelegate.h"
#import "MainMenuViewController.h"
#import "User.h"

@interface MapView : UIView <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) MKMapView *mapView;
@property (weak, nonatomic) id<MapDelegate> delegate;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocationCoordinate2D teachercoor;
@property (strong, nonatomic) BudaSpot *budascoop;
@property (strong, nonatomic) BudaSpot *budafabriek;
@property (strong, nonatomic) BudaSpot *budatoren;
@property (strong, nonatomic) BudaSpot *budalab;
@property (strong, nonatomic) NSTimer *teacherLocPushTimer;
@property (strong, nonatomic) NSTimer *teacherLocGetTimer;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) Teacher *teacher;

- (id)initWithFrame:(CGRect)frame AndUser:(User *)user;
- (void)updateWithSpots:(NSArray *)qspots;
- (void)createAnnotationWithTeacher:(Teacher *)teacher;

@end