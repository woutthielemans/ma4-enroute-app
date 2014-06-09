//
//  Camera.h
//  Retrospect
//
//  Created by Frederik Jacques on 26/09/12.
//  Copyright (c) 2012 the-nerd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Camera : UIView

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureDevice *device;
@property (nonatomic, strong) AVCaptureDeviceInput *deviceInput;
@property (nonatomic, strong) AVCaptureVideoDataOutput *videoOutput;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, strong) AVCaptureConnection *captureConnection;
@property (nonatomic, strong) AVCaptureStillImageOutput *stillImageOutput;

@property (nonatomic, strong) UIImageView *cameraControlBackgroundView;
@property (nonatomic, strong) UIButton *takePictureButton;

@property (nonatomic, strong) UIImageView *overlayImageView;
@property (nonatomic, strong) UIImage *overlayImage;

@property (nonatomic, strong) NSData *imageData;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic) float alphaPercentage;
@property (nonatomic) int swipeValue;

- (id)initWithFrame:(CGRect)frame andOverlayImage:(UIImage *)overlayImage;

@end
