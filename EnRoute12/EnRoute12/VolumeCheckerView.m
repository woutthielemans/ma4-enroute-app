//
//  VolumeCheckerView.m
//  VolumeChecker
//
//  Created by Wout Thielemans on 29/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "VolumeCheckerView.h"

@implementation VolumeCheckerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        self.progress = 0;
        self.ticks = 0;
        self.isTimerRunning = NO;
        
        self.tapSomewhereLabel = [[UILabel alloc] init];
        self.tapSomewhereLabel.text = @"tap ergens in het scherm";
        self.tapSomewhereLabel.frame = CGRectMake(0, 0, 200, 44);
        self.tapSomewhereLabel.center = CGPointMake(self.frame.size.width/2, self.frame.size.height*0.3);
        self.tapSomewhereLabel.tag = 30;
        self.tapSomewhereLabelLayer = [CALayer layer];
        self.tapSomewhereLabel.layer.opacity = 0.2f;
        [self.layer addSublayer:self.tapSomewhereLabelLayer];
        [self.layer addSublayer:self.tapSomewhereLabel.layer];
        
        self.cell = [CAEmitterCell emitterCell];
        self.cell.contents = (__bridge id)([UIImage imageNamed:@"emitCell"].CGImage);
        self.cell.birthRate = 50;
        self.cell.lifetime = 1;
        self.cell.lifetimeRange = 2;
        self.cell.velocity = 50;
        self.cell.velocityRange = 20;
        self.cell.name = @"smokeCell";
        self.cell.emissionRange = M_PI*2;
        self.cell.alphaSpeed = -0.2;
        
        self.emitter = [CAEmitterLayer layer];
        self.emitter.emitterPosition = CGPointMake(160, 240);
        self.emitter.emitterSize = CGSizeMake(80, 80);
        self.emitter.emitterCells = @[self.cell];
        self.emitter.opacity = 0;
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"[VolumeCheckerV] Touches began");
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    self.tapSomewhereLabel.layer.opacity = 0;
    self.xPos = p.x;
    self.yPos = p.y;
    
    self.emitter.opacity = 1;
    
    [self.layer addSublayer:self.emitter];
    
    [CATransaction setDisableActions:YES];
    self.emitter.emitterPosition = p;
    [CATransaction setDisableActions:NO];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"StartListeningForDBs"
                                                        object:nil
                                                      userInfo:nil];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [CATransaction setDisableActions:YES];
    self.xPos = p.x;
    self.yPos = p.y;
    [CATransaction setDisableActions:YES];
    self.emitter.emitterPosition = p;
    [CATransaction setDisableActions:NO];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"[VolumeCheckerV] Touches ended");
    self.tapSomewhereLabel.layer.opacity = 0.2f;
    [self.circleLayer removeFromSuperlayer];
    [self.bigrect removeFromSuperlayer];
    [self.emitter removeFromSuperlayer];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"StopListeningForDBs"
                                                        object:nil
                                                      userInfo:nil];
}

- (void)drawCircle:(CAShapeLayer*)circle WithLoudness:(float)loudness
{
    [self.circleLayer removeFromSuperlayer];
    [self.bigrect removeFromSuperlayer];
    
    self.loudness = loudness;
    self.circleSize = (pow((self.loudness*(-5)), -1))*20000;
    
    self.cell.velocity  = (50*self.circleSize)/75;
    self.cell.lifetime  = (1*self.circleSize)/100;
    
    self.cell.birthRate  = (50*self.circleSize)/75;
    
    NSLog(@"[VolumeCheckerV] LOUDNESS = %f",self.loudness);
    NSLog(@"[VolumeCheckerV] CIRCLESIZE = %i",self.circleSize);
    
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.bounds = CGRectMake(self.circleLayer.position.x, self.circleLayer.position.y, self.circleSize, self.circleSize);
    self.circleLayer.fillColor = [UIColor clearColor].CGColor;
    self.circleLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.circleLayer.position.x, self.circleLayer.position.y, self.circleSize, self.circleSize)].CGPath;
    if(self.isTimerRunning == YES)
    {
        self.circleLayer.strokeColor = [UIColor colorWithRed:171/255.0f green:221/255.0f blue:198/255.0f alpha:1].CGColor;
        self.circleLayer.lineWidth = 5.0f;
    }else{
        self.circleLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        self.circleLayer.lineWidth = 1.0f;
    }
    self.circleLayer.position = CGPointMake(self.xPos, self.yPos);
    [self.layer addSublayer:self.circleLayer];
    
//    self.circleLayerFill = [CAShapeLayer layer];
//    self.circleLayerFill.bounds = CGRectMake(self.circleLayerFill.position.x, self.circleLayerFill.position.y, self.circleSize, self.circleSize);
//    self.circleLayerFill.fillColor = [UIColor colorWithRed:171/255.0f green:221/255.0f blue:198/255.0f alpha:.5].CGColor;
//    self.circleLayerFill.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.circleLayerFill.position.x, self.circleLayerFill.position.y, self.circleSize, self.circleSize)].CGPath;
//    self.circleLayerFill.strokeColor = [UIColor clearColor].CGColor;
//    self.circleLayerFill.lineWidth = 0.f;
//    self.circleLayerFill.position = CGPointMake(self.xPos, self.yPos);
//    [self.layer addSublayer:self.circleLayerFill];
    
//    self.rotCircleLayer = [CAShapeLayer layer];
//    self.rotCircleLayer.bounds = CGRectMake(0, 0, 10, 10);
//    self.rotCircleLayer.fillColor = [UIColor greenColor].CGColor;
//    self.rotCircleLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 10, 10)].CGPath;
//    self.rotCircleLayer.strokeColor = [UIColor clearColor].CGColor;
//    self.rotCircleLayer.lineWidth = 0.f;
//    self.rotCircleLayer.position = CGPointMake(self.xPos+self.circleLayer.frame.size.width/2, self.yPos+self.circleLayer.frame.size.height/2);
////    self.rotCircleLayer.anchorPoint = self.circleLayer.position;
//    self.rotCircleLayer.opacity = 0.3;
//    [self.layer addSublayer:self.rotCircleLayer];
    
    self.bigrect = [CAShapeLayer layer];
    self.bigrect.bounds = CGRectMake(0, self.frame.size.height, self.frame.size.width, (self.progress)*self.frame.size.height);
}

- (void)startTimer
{
    if (self.isTimerRunning == NO) {
        NSLog(@"[VolumeCheckerView] Timer started");
        self.progressTimer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                              target:self
                                                            selector:@selector(updateProgress:)
                                                            userInfo:nil
                                                             repeats:YES];
        self.isTimerRunning = YES;
    }
    
}

- (void)updateProgress:id
{
    NSLog(@"[VolumeCheckerView] Timer updated progress: %f and ticks: %f",self.progress,self.ticks);
    self.progress = (self.ticks*0.72)/500;
    self.ticks++;
//    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
//    CGPoint rotationPoint = CGPointMake(self.circleLayer.position.x-center.x, self.circleLayer.position.y);
    //rotate circle
//    CATransform3D rottransform = CATransform3DIdentity;
//    self.rotCircleLayer.transform = rottransform;
//    rottransform = CATransform3DTranslate(rottransform, rotationPoint.x-center.x, rotationPoint.y-center.y, 0.0);
//    rottransform = CATransform3DRotate(rottransform, 6, 0.0, 0.0, -1.0);
//    rottransform = CATransform3DTranslate(rottransform, center.x-rotationPoint.x, center.y-rotationPoint.y, 0.0);
//    CATransform3D current = self.rotCircleLayer.transform;
//    self.rotCircleLayer.transform = CATransform3DRotate(current, DEGREES_TO_RADIANS(20), 0, 1.0, 0);
}

- (void)stopAndResetTimer
{
    NSLog(@"[VolumeCheckerView] Timer stopped and reset");
    [self.progressTimer invalidate];
    self.progressTimer = nil;
    self.ticks = 0;
    self.progress = 0;
    self.isTimerRunning = NO;
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
