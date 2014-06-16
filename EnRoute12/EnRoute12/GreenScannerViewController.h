//
//  GreenScannerViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "GreenScannerView.h"
#import "User.h"
#import "GreenScannerOverlayView.h"

@interface GreenScannerViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSCoding>

@property (strong, nonatomic) GreenScannerView *greenScannerView;
@property (strong, nonatomic) UIImagePickerController *picker;
@property (strong, nonatomic) NSTimer *updateTimer;
@property (strong, nonatomic) User *user;
@property (nonatomic) float xPos;
@property (nonatomic) float yPos;
@property (strong, nonatomic) GreenScannerOverlayView *greenScannerOverlayView;

- (id)initWithUser:(User *)user;

@end
