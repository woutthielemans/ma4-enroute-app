//
//  EnterQuoteView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "EnterQuoteView.h"

@implementation EnterQuoteView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        self.txtQuote = [[UITextField alloc] initWithFrame:CGRectMake(15, 100, self.frame.size.width - 30, 44)];
        self.txtQuote.backgroundColor = [UIColor colorWithRed:249/255.0f green:249/255.0f blue:249/255.0f alpha:1];
        [self addSubview:self.txtQuote];
//        
//        self.btnSave = [UIButton buttonWithType:UIButtonTypeSystem];
//        [self.btnSave setTitle:@"Save Spot" forState:UIControlStateNormal];
//        self.btnSave.frame = CGRectMake(0, 0, self.frame.size.width - 30, 44);
//        self.btnSave.center = CGPointMake(self.frame.size.width/2, self.txtQuote.center.y + self.txtQuote.frame.size.height + 15);
//        [self addSubview:self.btnSave];
        
        UIImage *gobutton = [UIImage imageNamed:@"go"];
        self.btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnSave.frame = CGRectMake(0, 0, gobutton.size.width, gobutton.size.height);
        self.btnSave.center = CGPointMake(self.frame.size.width/2, self.txtQuote.center.y + self.txtQuote.frame.size.height + 15);
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
