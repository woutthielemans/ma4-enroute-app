//
//  QuoteCameraOverlayView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "QuoteCameraOverlayView.h"

@implementation QuoteCameraOverlayView

- (id)initWithFrame:(CGRect)frame AndQuote:(Quote *)quote
{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSString *quotetext = [quote.quotetext uppercaseString];
        UIFont *font = [UIFont fontWithName:PLUTO_SANS_BOLD size:40];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 5.0;
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:quotetext];
        [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedString.length)];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attributedString.length)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, attributedString.length)];
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(15, 30, frame.size.width-30, self.frame.size.height-30)];
        [textView setBackgroundColor:[UIColor clearColor]];
        
        textView.attributedText = attributedString;
        textView.editable = NO;
        textView.selectable = NO;
        
        [self addSubview:textView];
        
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
