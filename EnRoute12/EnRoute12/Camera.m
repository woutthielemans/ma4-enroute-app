//
//  Camera.m
//  Retrospect
//
//  Created by Frederik Jacques on 26/09/12.
//  Copyright (c) 2012 the-nerd. All rights reserved.
//

#import "Camera.h"

@interface Camera()
- (void)createPhotoControlBackground;
- (void)createTakePhotoImage;
@end

@implementation Camera

//@synthesize captureSession = _captureSession;
//@synthesize device = _device;
//@synthesize deviceInput = _deviceInput;
//@synthesize videoOutput = _videoOutput;
//@synthesize previewLayer = _previewLayer;
//@synthesize captureConnection = _captureConnection;
//@synthesize stillImageOutput = _stillImageOutput;
//
//@synthesize cameraControlBackgroundView = _cameraControlBackgroundView;
//@synthesize takePictureButton = _takePictureButton;
//
//@synthesize overlayImageView = _overlayImageView;
//@synthesize overlayImage = _overlayImage;
//
//@synthesize imageData = _imageData;
//@synthesize image = _image;
//
//@synthesize swipeValue = _swipeValue;
//@synthesize alphaPercentage = _alphaPercentage;

- (id)initWithFrame:(CGRect)frame andOverlayImage:(UIImage *)overlayImage {
    self = [self initWithFrame:frame];
    
    self.overlayImage = overlayImage;
    
    self.overlayImageView = [[UIImageView alloc] initWithImage:self.overlayImage];
    self.overlayImageView.frame = self.frame;
    self.overlayImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:self.overlayImageView];
    
    self.alphaPercentage = 50.0;
    self.swipeValue = 50;
    
    [self bringSubviewToFront:self.cameraControlBackgroundView];
    [self bringSubviewToFront:self.takePictureButton];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panning:)];
    [self addGestureRecognizer:pan];
    
    return self;
}

- (void)panning:(UIPanGestureRecognizer *)panGesture {

    CGPoint vel = [panGesture velocityInView:self];
    if (vel.x > 0) {
        // user dragged towards the right
        self.swipeValue += 2;
        if(self.swipeValue > 100){
            self.swipeValue = 100;
        }
    }
    else {
        // user dragged towards the left
        self.swipeValue -= 2;
        if(self.swipeValue < 0){
            self.swipeValue = 0;
        }
    }
    
    self.alphaPercentage = self.swipeValue;
    
}

- (void)setAlphaPercentage:(float)alphaPercentage {
    
    if( _alphaPercentage != alphaPercentage ){
        _alphaPercentage = alphaPercentage;
        
        if( _alphaPercentage < 0 ){
            _alphaPercentage = 0;
        }
        
        if( _alphaPercentage > 100 ){
            _alphaPercentage = 100;
        }
        
        self.overlayImageView.alpha = (_alphaPercentage / 100);
    }
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSLog(@"[Camera] Init with frame %f - %f", frame.size.width, frame.size.height);
        self.captureSession = [[AVCaptureSession alloc] init];
        self.captureSession.sessionPreset = AVCaptureSessionPresetMedium;
        
        NSError *error = nil;
        self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        self.deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:&error];
        
        // Setup input device
        if( self.deviceInput ){
            [self.captureSession addInput:self.deviceInput];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Woops..." message:@"I couldn't find any capture device" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }
        
        // Setup video output and add to the session
        self.videoOutput = [[AVCaptureVideoDataOutput alloc] init];
        NSDictionary *rgbOutputSettings = [NSDictionary dictionaryWithObject:
                                           [NSNumber numberWithInt:kCMPixelFormat_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
        [self.videoOutput setVideoSettings:rgbOutputSettings];
        
        if( self.videoOutput ){
            [self.captureSession addOutput:self.videoOutput];
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Woops..." message:@"I couldn't create an output for the video stream" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }
        
        // Setup preview layer to show the video data
        self.previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
        self.previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        self.previewLayer.frame = self.frame;
        [self.layer addSublayer:self.previewLayer];
        
        // Setup grabbing of images and add to the session
        self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
        NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:
                                        AVVideoCodecJPEG, AVVideoCodecKey, nil];
        [self.stillImageOutput setOutputSettings:outputSettings];
        
        [self.captureSession addOutput:self.stillImageOutput];
        
//        self.captureConnection = nil;
        for (AVCaptureConnection *connection in self.stillImageOutput.connections) {
            for (AVCaptureInputPort *port in [connection inputPorts]) {
                if ([[port mediaType] isEqual:AVMediaTypeVideo] ) {
                    self.captureConnection = connection;
                    break;
                }
            }
            if (self.captureConnection) { break; }
        }
        
        // Start the video session
        [self.captureSession startRunning];
        
        // Add controls
        [self createPhotoControlBackground];
        [self createTakePhotoImage];
    }
    return self;
}

- (void)takePictureHandler:(id)sender {
    NSLog(@"[Camera] Take Picture");
    [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:self.captureConnection completionHandler:
     ^(CMSampleBufferRef imageSampleBuffer, NSError *error) {
         
         // Got the image, show actionsheet
         self.imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
         self.image = [UIImage imageWithData:self.imageData];
         
         NSLog(@"[Camerea] Image width %f and height %f", self.image.size.width, self.image.size.height);
         
         [[NSNotificationCenter defaultCenter] postNotificationName:@"PHOTO_TAKEN" object:self];
     }];
}

- (void)createPhotoControlBackground {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"background_camera_control" ofType:@"png" inDirectory:@"images/app"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
    NSLog(@"[Camera] Path %@", path);
    
    self.cameraControlBackgroundView = [[UIImageView alloc] initWithImage:image];
    
    CGRect newRect = self.cameraControlBackgroundView.frame;
    newRect.origin.y = self.frame.size.height - self.cameraControlBackgroundView.frame.size.height;
    self.cameraControlBackgroundView.frame = newRect;
    
    [self addSubview:self.cameraControlBackgroundView];
}

- (void)createTakePhotoImage {
    // Add shoot button
    NSString *takePicturePath = [[NSBundle mainBundle] pathForResource:@"button_take_photo" ofType:@"png" inDirectory:@"images/app"];
    UIImage *takePictureImage = [[UIImage alloc] initWithContentsOfFile:takePicturePath];
    
    self.takePictureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.takePictureButton.frame = CGRectMake(138, 372, 44, 45);
    [self.takePictureButton setBackgroundImage:takePictureImage forState:UIControlStateNormal];
    [self.takePictureButton addTarget:self action:@selector(takePictureHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.takePictureButton];
}

@end
