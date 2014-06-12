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
        self.listenLabel.alpha = 0.f;
        self.listenLabel.textColor = UIColor colorWithRed:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>
        [self addSubview:self.listenLabel];
        
        self.tapSomewhereLabel = [[UILabel alloc] init];
        self.tapSomewhereLabel.text = @"tap ergens in het scherm";
        self.tapSomewhereLabel.frame = CGRectMake(0, 0, 200, 44);
        self.tapSomewhereLabel.center = CGPointMake(self.frame.size.width/2, self.frame.size.height*0.3);
        self.tapSomewhereLabel.tag = 30;
        self.tapSomewhereLabel.alpha = 0.2f;
        [self addSubview:self.tapSomewhereLabel];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"[VolumeCheckerV] Touches began");
    self.tapSomewhereLabel.alpha = 0.f;
//    self.btnListen.alpha = 0.2f;
    self.listenLabel.alpha = 0.2f;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"StartListeningForDBs"
                                                        object:nil
                                                      userInfo:nil];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"[VolumeCheckerV] Touches ended");
    self.tapSomewhereLabel.alpha = 0.2f;
//    self.btnListen.alpha = 0.f;
    self.listenLabel.alpha = 0.f;
    
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
