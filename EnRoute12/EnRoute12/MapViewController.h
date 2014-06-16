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
#import <CoreLocation/CoreLocation.h>
#import "MapView.h"
#import "QuietSpotFactory.h"
#import "QuietSpot.h"
#import "MapDelegate.h"
#import "User.h"
#import "Teacher.h"
#import "TeacherFactory.h"
#import "MenuViewController.h"
#import "MainMenuDelegate.h"
//#import "NotificationsTableViewController.h"

@interface MapViewController : UIViewController <MapDelegate, MenuDelegate, NSCoding>

@property (strong, nonatomic) MapView *mapView;
@property (weak ,nonatomic) id<MainMenuDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *qspots;
@property (strong, nonatomic) UIButton *btnBack;
@property (strong, nonatomic) UIButton *btnMenu;
@property (strong, nonatomic) UIImage *backarrowmap;
@property (strong, nonatomic) UIImage *menubuttonmap;
@property (strong, nonatomic) User *user;
@property (nonatomic) BOOL menuIsOut;
@property (strong, nonatomic) MenuViewController *menuVC;

- (id)initWithUser:(User *)user;

@end
