//
//  QuoteView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "QuoteView.h"

@implementation QuoteView

- (id)initWithFrame:(CGRect)frame andQuote:(Quote *)quote
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.quote = quote;
        self.backgroundColor = [UIColor blackColor];
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:self.imageView];
        
        self.quoteoverlay = [[QuoteCameraOverlayView alloc] initWithFrame:CGRectMake(self.frame.size.width, 0, self.frame.size.width, self.frame.size.height) AndQuote:self.quote];
        [self addSubview:self.quoteoverlay];
        
        UIImage *photoredobutton = [UIImage imageNamed:@"photoredobutton"];
        self.retakeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.retakeButton.frame = CGRectMake(30, self.frame.size.height - photoredobutton.size.height - 30 + 200, photoredobutton.size.width, photoredobutton.size.height);
        [self.retakeButton setBackgroundImage:photoredobutton forState:UIControlStateNormal];
        [self addSubview:self.retakeButton];
        
        UIImage *photosharebutton = [UIImage imageNamed:@"photosharebutton"];
        self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.shareButton.frame = CGRectMake(self.frame.size.width/2 - photosharebutton.size.width/2, self.frame.size.height - photosharebutton.size.height - 30 + 200, photosharebutton.size.width, photosharebutton.size.height);
        [self.shareButton setBackgroundImage:photosharebutton forState:UIControlStateNormal];
        [self addSubview:self.shareButton];
        
        UIImage *photocheckbutton = [UIImage imageNamed:@"photocheckbutton"];
        self.useButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.useButton.frame = CGRectMake(self.frame.size.width - photocheckbutton.size.width - 30, self.frame.size.height - photocheckbutton.size.height - 30 + 200, photocheckbutton.size.width, photocheckbutton.size.height);
        [self.useButton setBackgroundImage:photocheckbutton forState:UIControlStateNormal];
        [self addSubview:self.useButton];
        
        self.succesimage = [UIImage imageNamed:@"succes"];
        self.succes = [[UIImageView alloc] initWithImage:self.succesimage];
        self.succes.frame = CGRectMake(0, 0, self.succesimage.size.width, self.succesimage.size.height);
        self.succes.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        self.succes.alpha = 0.f;
        [self addSubview:self.succes];
        
    }
    return self;
}

- (void)showContent
{
    self.timerButton1 = [NSTimer scheduledTimerWithTimeInterval:1.1 target: self selector:@selector(animateButton1:) userInfo:nil repeats:NO];
    self.timerButton1 = [NSTimer scheduledTimerWithTimeInterval:1.3 target: self selector:@selector(animateButton2:) userInfo:nil repeats:NO];
    self.timerButton1 = [NSTimer scheduledTimerWithTimeInterval:1.5 target: self selector:@selector(animateButton3:) userInfo:nil repeats:NO];
    
    [UIView animateWithDuration:1.f animations:^{
        
        CGRect ivframe = self.imageView.frame;
        ivframe.origin.x -= self.frame.size.width;
        self.imageView.frame = ivframe;
        
        CGRect qframe = self.quoteoverlay.frame;
        qframe.origin.x -= self.frame.size.width;
        self.quoteoverlay.frame = qframe;
        
    }completion:^(BOOL finished){
        
        UIGraphicsBeginImageContext(self.bounds.size);
        [self.window.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *screenshot=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.savethisphoto = screenshot;
        
    }];
}

- (void)animateButton1:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        
        CGRect retakeframe = self.retakeButton.frame;
        retakeframe.origin.y -= 200;
        self.retakeButton.frame = retakeframe;
        
    }completion:^(BOOL finished){}];
}

- (void)animateButton2:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        
        CGRect shareframe = self.shareButton.frame;
        shareframe.origin.y -= 200;
        self.shareButton.frame = shareframe;
        
    }completion:^(BOOL finished){}];
}

- (void)animateButton3:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        
        CGRect useframe = self.useButton.frame;
        useframe.origin.y -= 200;
        self.useButton.frame = useframe;
        
    }completion:^(BOOL finished){}];
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
