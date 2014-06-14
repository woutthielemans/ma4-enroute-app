//
//  VolumeCheckerView.h
//  VolumeChecker
//
//  Created by Wout Thielemans on 29/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)

@interface VolumeCheckerView : UIView

//@property (strong, nonatomic) UIButton *btnListen;
@property (strong, nonatomic) UILabel *listenLabel;
@property (strong, nonatomic) CALayer *listenLabelLayer;
@property (strong, nonatomic) UILabel *tapSomewhereLabel;
@property (strong, nonatomic) CALayer *tapSomewhereLabelLayer;
@property (strong, nonatomic) CAShapeLayer *circleLayer;
@property (strong, nonatomic) CAShapeLayer *mcircleLayer;
@property (strong, nonatomic) CAShapeLayer *circleEmmit;
@property (strong, nonatomic) CAShapeLayer *bigrect;
@property (nonatomic) float loudness;
@property (nonatomic) float xPos;
@property (nonatomic) float yPos;
@property (nonatomic) int circleSize;
@property (nonatomic) float progress;
@property (nonatomic) float ticks;
@property (strong, nonatomic) NSTimer *progressTimer;
@property (nonatomic) BOOL isTimerRunning;
@property (strong, nonatomic) CAEmitterLayer *emitter;
@property (strong, nonatomic) CAEmitterCell *cell;
@property (strong, nonatomic) CAEmitterLayer *memitter;
@property (strong, nonatomic) CAEmitterCell *mcell;

- (void)drawCircle:(CAShapeLayer*)circle WithLoudness:(float)loudness;
- (void)startTimer;
- (void)stopAndResetTimer;

@end
