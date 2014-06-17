//
//  AddNotView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "AddNotView.h"

@implementation AddNotView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.txtHour = [[UITextField alloc] initWithFrame:CGRectMake(15, 50, self.frame.size.width-30, 44)];
        self.txtHour.placeholder = @"Uur";
        self.txtHour.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.txtHour];
        
        self.txtTitle = [[UITextField alloc] initWithFrame:CGRectMake(15, self.txtHour.frame.origin.y + 15 + self.txtTitle.frame.size.height, self.frame.size.width-30, 44)];
        self.txtHour.placeholder = @"Boodschap";
        self.txtHour.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.txtHour];
        
        UIImage *gobutton = [UIImage imageNamed:@"go"];
        self.btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnSave.frame = CGRectMake(0, 0, gobutton.size.width, gobutton.size.height);
        self.btnSave.center = CGPointMake(self.frame.size.width/2, self.txtHour.center.y + self.txtHour.frame.size.height + 15);
        [self.btnSave setBackgroundImage:gobutton forState:UIControlStateNormal];
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
