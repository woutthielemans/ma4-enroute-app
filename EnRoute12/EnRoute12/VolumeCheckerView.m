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
        self.btnListen = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.btnListen setTitle:@"Listen" forState:UIControlStateNormal];
        self.btnListen.frame = CGRectMake(0, 0, 200, 44);
        self.btnListen.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:self.btnListen];
    }
    return self;
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
