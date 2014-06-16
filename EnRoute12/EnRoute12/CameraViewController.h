//
//  CameraViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <Social/Social.h>
#import "CameraView.h"
#import "AssignmentCameraOverlayView.h"
#import "User.h"

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSCoding>

@property (strong, nonatomic) CameraView *cameraView;
@property (strong, nonatomic) AssignmentCameraOverlayView *asCameraOverlay;
@property (strong, nonatomic) UIImagePickerController *picker;
@property (strong, nonatomic) User *user;
@property (nonatomic) BOOL curcameraisfront;

- (id)initWithUser:(User *)user;

@end
