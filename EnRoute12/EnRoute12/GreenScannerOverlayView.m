//
//  GreenScannerOverlayView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "GreenScannerOverlayView.h"

@implementation GreenScannerOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"[VolumeCheckerV] Touches began");
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    self.xPos = p.x;
    self.yPos = p.y;
    
    if (self.xPos < self.frame.size.width/2 && self.yPos < (self.frame.size.height/4)*1) {
        NSLog(@"[GreenScannerView] Tapped zone 1");
        [self scanZone1];
    }else if (self.xPos > self.frame.size.width/2 && self.yPos < (self.frame.size.height/4)*1) {
        NSLog(@"[GreenScannerView] Tapped zone 2");
        [self scanZone2];
    }else if (self.xPos < self.frame.size.width/2 && self.yPos > (self.frame.size.height/4)*1 && self.yPos < (self.frame.size.height/4)*2) {
        NSLog(@"[GreenScannerView] Tapped zone 3");
        [self scanZone3];
    }else if (self.xPos > self.frame.size.width/2 && self.yPos > (self.frame.size.height/4)*1 && self.yPos < (self.frame.size.height/4)*2) {
        NSLog(@"[GreenScannerView] Tapped zone 4");
        [self scanZone4];
    }else if (self.xPos < self.frame.size.width/2 && self.yPos > (self.frame.size.height/4)*2 && self.yPos < (self.frame.size.height/4)*3) {
        NSLog(@"[GreenScannerView] Tapped zone 5");
        [self scanZone5];
    }else if (self.xPos > self.frame.size.width/2 && self.yPos > (self.frame.size.height/4)*2 && self.yPos < (self.frame.size.height/4)*3) {
        NSLog(@"[GreenScannerView] Tapped zone 6");
        [self scanZone6];
    }else if (self.xPos < self.frame.size.width/2 && self.yPos > (self.frame.size.height/4)*3) {
        NSLog(@"[GreenScannerView] Tapped zone 7");
        [self scanZone7];
    }else if (self.xPos > self.frame.size.width/2 && self.yPos > (self.frame.size.height/4)*3) {
        NSLog(@"[GreenScannerView] Tapped zone 8");
        [self scanZone8];
    }
    
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
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"[VolumeCheckerV] Touches ended");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"StopListeningForDBs"
                                                        object:nil
                                                      userInfo:nil];
}

- (void)listening/*:(id)sender*/
{
    NSLog(@"[VolumeCheckerVC] Listen button pushed");
}

- (void)stopListening/*:(id)sender*/
{
    NSLog(@"[VolumeCheckerVC] Listen button released");
}

- (void)scanZone1
{
    NSLog(@"[GreenScannerView] Scanning zone 1...");
}

- (void)scanZone2
{
    NSLog(@"[GreenScannerView] Scanning zone 2...");
}

- (void)scanZone3
{
    NSLog(@"[GreenScannerView] Scanning zone 3...");
}

- (void)scanZone4
{
    NSLog(@"[GreenScannerView] Scanning zone 4...");
}

- (void)scanZone5
{
    NSLog(@"[GreenScannerView] Scanning zone 5...");
}

- (void)scanZone6
{
    NSLog(@"[GreenScannerView] Scanning zone 6...");
}

- (void)scanZone7
{
    NSLog(@"[GreenScannerView] Scanning zone 7...");
}

- (void)scanZone8
{
    NSLog(@"[GreenScannerView] Scanning zone 8...");
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
