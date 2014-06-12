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
        
//        self.btnListen = [UIButton buttonWithType:UIButtonTypeSystem];
//        [self.btnListen setTitle:@"Listen" forState:UIControlStateNormal];
//        self.btnListen.frame = CGRectMake(0, 0, 200, 44);
//        self.btnListen.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
//        [self addSubview:self.btnListen];
        
        self.listenLabel = [[UILabel alloc] init];
        self.listenLabel.text = @"Luisteren...";
        self.listenLabel.frame = CGRectMake(0, 0, 100, 44);
        self.listenLabel.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        self.listenLabel.textColor = [UIColor colorWithRed:0 green:121/255.0f blue:1 alpha:1];
//        [self addSubview:self.listenLabel];
        self.listenLabelLayer = [CALayer layer];
//        self.listenLabelLayer.contents = self.listenLabel;
//        self.tapSomewhereLabelLayer.opacity = 0;
        self.listenLabel.layer.opacity = 0;
        [self.layer addSublayer:self.listenLabelLayer];
        [self.layer addSublayer:self.listenLabel.layer];
        
        self.tapSomewhereLabel = [[UILabel alloc] init];
        self.tapSomewhereLabel.text = @"tap ergens in het scherm";
        self.tapSomewhereLabel.frame = CGRectMake(0, 0, 200, 44);
        self.tapSomewhereLabel.center = CGPointMake(self.frame.size.width/2, self.frame.size.height*0.3);
        self.tapSomewhereLabel.tag = 30;
//        [self addSubview:self.tapSomewhereLabel];
        self.tapSomewhereLabelLayer = [CALayer layer];
//        self.tapSomewhereLabelLayer.contents = self.tapSomewhereLabel;
//        self.tapSomewhereLabelLayer.opacity = 1;
        self.tapSomewhereLabel.layer.opacity = 1;
        [self.layer addSublayer:self.tapSomewhereLabelLayer];
        [self.layer addSublayer:self.tapSomewhereLabel.layer];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"[VolumeCheckerV] Touches began");
    
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    self.tapSomewhereLabel.layer.opacity = 0;
    self.listenLabel.layer.opacity = 1;
    self.listenLabel.layer.position = p;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"StartListeningForDBs"
                                                        object:nil
                                                      userInfo:nil];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    self.listenLabel.layer.position = p;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"[VolumeCheckerV] Touches ended");
    self.tapSomewhereLabel.layer.opacity = 1;
    self.listenLabel.layer.opacity = 0;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"StopListeningForDBs"
                                                        object:nil
                                                      userInfo:nil];
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
