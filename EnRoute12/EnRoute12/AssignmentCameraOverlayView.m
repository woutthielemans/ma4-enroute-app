//
//  AssignmentCameraOverlayView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "AssignmentCameraOverlayView.h"

@implementation AssignmentCameraOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImage *overlayimage = [UIImage imageNamed:@"customcameraoverlay"];
        UIImageView *overlayimageview = [[UIImageView alloc] initWithImage:overlayimage];
        overlayimageview.frame = CGRectMake(0, 0, overlayimage.size.width, overlayimage.size.height);
        overlayimageview.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:overlayimageview];
        
        UIImage *cancelphoto = [UIImage imageNamed:@"cancelphoto"];
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.cancelButton.frame = CGRectMake(30, self.frame.size.height - cancelphoto.size.height - 30 + 200, cancelphoto.size.width, cancelphoto.size.height);
        [self.cancelButton setBackgroundImage:cancelphoto forState:UIControlStateNormal];
        [self addSubview:self.cancelButton];
        
        UIImage *customphotobutton = [UIImage imageNamed:@"customphotobutton"];
        self.takePhotoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.takePhotoButton.frame = CGRectMake(self.frame.size.width/2 - customphotobutton.size.width/2, self.frame.size.height - customphotobutton.size.height - 30 + 200, customphotobutton.size.width, customphotobutton.size.height);
        [self.takePhotoButton setBackgroundImage:customphotobutton forState:UIControlStateNormal];
        [self addSubview:self.takePhotoButton];
        
        UIImage *switchcamera = [UIImage imageNamed:@"switchcamera"];
        self.switchCameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.switchCameraButton.frame = CGRectMake(self.frame.size.width - switchcamera.size.width - 30, self.frame.size.height - switchcamera.size.height - 30 + 200, switchcamera.size.width, switchcamera.size.height);
        [self.switchCameraButton setBackgroundImage:switchcamera forState:UIControlStateNormal];
        [self addSubview:self.switchCameraButton];
        
        self.timerButton1 = [NSTimer scheduledTimerWithTimeInterval:1.1 target: self selector:@selector(animateButton1:) userInfo:nil repeats:NO];
        self.timerButton1 = [NSTimer scheduledTimerWithTimeInterval:1.3 target: self selector:@selector(animateButton2:) userInfo:nil repeats:NO];
        self.timerButton1 = [NSTimer scheduledTimerWithTimeInterval:1.5 target: self selector:@selector(animateButton3:) userInfo:nil repeats:NO];
    }
    return self;
}

- (void)animateButton1:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        
        CGRect cancelframe = self.cancelButton.frame;
        cancelframe.origin.y -= 200;
        self.cancelButton.frame = cancelframe;
        
    }completion:^(BOOL finished){}];
}

- (void)animateButton2:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        
        CGRect takephotoframe = self.takePhotoButton.frame;
        takephotoframe.origin.y -= 200;
        self.takePhotoButton.frame = takephotoframe;
        
    }completion:^(BOOL finished){}];
}

- (void)animateButton3:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        
        CGRect switchcameraframe = self.switchCameraButton.frame;
        switchcameraframe.origin.y -= 200;
        self.switchCameraButton.frame = switchcameraframe;
        
    }completion:^(BOOL finished){}];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
