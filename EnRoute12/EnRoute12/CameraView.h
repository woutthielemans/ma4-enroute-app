//
//  CameraView.h
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (strong, nonatomic) UIButton *retakeButton;
@property (strong, nonatomic) UIButton *shareButton;
@property (strong, nonatomic) UIButton *useButton;
@property (strong, nonatomic) UIButton *useButtonSucces;
@property (strong, nonatomic) UIImage *savethisphoto;
@property (strong, nonatomic) NSTimer *timerButton1;
@property (strong, nonatomic) NSTimer *timerButton2;
@property (strong, nonatomic) NSTimer *timerButton3;
@property (strong, nonatomic) UIImage *succesimage;
@property (strong, nonatomic) UIImageView *succes;

- (void)showContent;

@end
