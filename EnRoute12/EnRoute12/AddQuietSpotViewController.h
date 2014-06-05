//
//  AddQuietSpotViewController.h
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddQuietSpotView.h"
#import "AddQuietSpotViewDelegate.h"
#import "QuietSpot.h"
#import "QuietSpotFactory.h"

@interface AddQuietSpotViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) AddQuietSpotView *addQuietSpotView;
@property (weak, nonatomic) id<AddQuietSpotViewDelegate> delegate;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocationCoordinate2D usercoor;
@property (nonatomic, strong) NSNumber *userlongitude;
@property (nonatomic, strong) NSNumber *userlatitude;

@end
