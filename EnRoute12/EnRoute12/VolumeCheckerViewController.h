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
#import "VolumeCheckerView.h"
#import "AddQuietSpotViewDelegate.h"
#import "AddQuietSpotViewController.h"
#import "QuietSpot.h"
#import "MapViewController.h"
#import "AddQuietSpotView.h"

@interface VolumeCheckerViewController : UIViewController <AddQuietSpotViewDelegate>

@property (strong, nonatomic) VolumeCheckerView *volumeCheckerView;
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) NSTimer *levelTimer;
@property (strong, nonatomic) NSTimer *acceptTimer;

- (void)levelTimerCallback:(NSTimer *)timer;

@end
