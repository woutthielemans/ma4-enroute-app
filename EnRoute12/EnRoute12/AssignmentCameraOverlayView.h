//
//  AssignmentCameraOverlayView.h
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssignmentCameraOverlayView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *takePhotoButton;
@property (strong, nonatomic) UIButton *switchCameraButton;
@property (strong, nonatomic) NSTimer *timerButton1;
@property (strong, nonatomic) NSTimer *timerButton2;
@property (strong, nonatomic) NSTimer *timerButton3;

- (void)showContent;

@end
