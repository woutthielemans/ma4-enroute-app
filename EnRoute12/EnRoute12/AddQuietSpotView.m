//
//  AddQuietSpotView.m
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "AddQuietSpotView.h"

@implementation AddQuietSpotView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:230/255.0f green:230/255.0f blue:230/255.0f alpha:1];
        
        self.txtTitle = [[UITextField alloc] initWithFrame:CGRectMake(15, 50, self.frame.size.width-30, 44)];
        self.txtTitle.placeholder = @"Title";
        self.txtTitle.backgroundColor = [UIColor colorWithRed:249/255.0f green:249/255.0f blue:249/255.0f alpha:1];
        [self addSubview:self.txtTitle];
        
        self.txtSubtitle = [[UITextField alloc] initWithFrame:CGRectMake(15, self.txtTitle.frame.origin.y + self.txtTitle.frame.size.height + 15, self.frame.size.width-30, 44)];
        self.txtSubtitle.placeholder = @"Subtitle";
        self.txtSubtitle.backgroundColor = [UIColor colorWithRed:249/255.0f green:249/255.0f blue:249/255.0f alpha:1];
        [self addSubview:self.txtSubtitle];
        
        self.btnSave = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.btnSave setTitle:@"Save Spot" forState:UIControlStateNormal];
        self.btnSave.frame = CGRectMake(0, 0, self.frame.size.width - 30, 44);
        self.btnSave.center = CGPointMake(self.frame.size.width/2, self.txtSubtitle.center.y + self.txtSubtitle.frame.size.height + 15);
        [self addSubview:self.btnSave];
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
