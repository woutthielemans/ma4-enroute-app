//
//  MapViewController.h
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <QuartzCore/QuartzCore.h>
#import "MapView.h"
#import "QuietSpotFactory.h"
#import "QuietSpot.h"

@interface MapViewController : UIViewController

@property (strong, nonatomic) MapView *mapView;
@property (strong, nonatomic) NSMutableArray *qspots;
@property (strong, nonatomic) UIButton *btnBack;
@property (strong, nonatomic) UIButton *btnMenu;
@property (strong, nonatomic) UIImage *backarrowmap;
@property (strong, nonatomic) UIImage *menubuttonmap;

@end
