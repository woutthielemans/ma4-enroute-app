//
//  VolumeCheckerViewController.h
//  VolumeChecker
//
//  Created by Wout Thielemans on 29/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVAudioSession.h>
#import <AFNetworking.h>
#import "VolumeCheckerView.h"
#import "AddQuietSpotViewDelegate.h"
#import "AddQuietSpotViewController.h"
#import "QuietSpot.h"
#import "MapViewController.h"
#import "AddQuietSpotView.h"
#import "VolumeCheckerDelegate.h"
#import "AssignmentViewController.h"
#import "User.h"
#import "MenuViewController.h"
#import "MenuDelegate.h"
#import "NotificationsViewController.h"

@interface VolumeCheckerViewController : UIViewController <AddQuietSpotViewDelegate, NSCoding, MenuDelegate>

@property (weak, nonatomic) id<VolumeCheckerDelegate> delegate;
@property (strong, nonatomic) VolumeCheckerView *volumeCheckerView;
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) NSTimer *levelTimer;
@property (strong, nonatomic) NSTimer *acceptTimer;
@property (strong, nonatomic) UIButton *btnBack;
@property (strong, nonatomic) UIButton *btnMenu;
@property (strong, nonatomic) UIImage *backarrow;
@property (strong, nonatomic) UIImage *menubutton;
@property (strong, nonatomic) NSString *ptitle;
@property (strong, nonatomic) NSString *psubtitle;
@property (strong, nonatomic) NSString *puserlongitude;
@property (strong, nonatomic) NSString *puserlatitude;
@property (strong, nonatomic) User *user;
@property (nonatomic) BOOL menuIsOut;
@property (strong, nonatomic) MenuViewController *menuVC;

- (id)initWithUser:(User *)user;
- (void)levelTimerCallback:(NSTimer *)timer;

@end
