//
//  MainMenuView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 08/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MainMenuView.h"

@implementation MainMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.timerButton = [NSTimer scheduledTimerWithTimeInterval:0.1 target: self selector:@selector(animateButton1:) userInfo:nil repeats:NO];
        self.timerButton = [NSTimer scheduledTimerWithTimeInterval:0.3 target: self selector:@selector(animateButton2:) userInfo:nil repeats:NO];
        self.timerButton = [NSTimer scheduledTimerWithTimeInterval:0.5 target: self selector:@selector(animateButton3:) userInfo:nil repeats:NO];
        self.timerButton = [NSTimer scheduledTimerWithTimeInterval:0.7 target: self selector:@selector(animateButton4:) userInfo:nil repeats:NO];
        self.timerButton = [NSTimer scheduledTimerWithTimeInterval:0.9 target: self selector:@selector(animateButton5:) userInfo:nil repeats:NO];
        
        // Logo
        UIImage *logo = [UIImage imageNamed:@"hmi_homelogo"];
        UIImageView *logoImageView = [[UIImageView alloc] initWithImage:logo];
        logoImageView.frame = CGRectMake(20, 40, logo.size.width, logo.size.height);
        [self addSubview:logoImageView];
        
        // button: de stille stad
        UIImage *stilbg = [UIImage imageNamed:@"hmi_destillestad"];
        self.btnStil = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnStil.frame = CGRectMake(logoImageView.frame.origin.x + logoImageView.frame.size.width + 20, 35, stilbg.size.width - 20, stilbg.size.height - 20);
        [self.btnStil setBackgroundImage:stilbg forState:UIControlStateNormal];
        self.btnStil.alpha = 0.f;
        [self addSubview:self.btnStil];
        
        // button: de vriendelijke stad
        UIImage *vriendbg = [UIImage imageNamed:@"hmi_devriendelijkestad"];
        self.btnVriend = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnVriend.frame = CGRectMake(logoImageView.frame.origin.x, logoImageView.frame.origin.y + logoImageView.frame.size.height + 15, vriendbg.size.width - 20, vriendbg.size.height - 20);
        [self.btnVriend setBackgroundImage:vriendbg forState:UIControlStateNormal];
        self.btnVriend.alpha = 0.f;
        [self addSubview:self.btnVriend];
        
        // button: de groene stad
        UIImage *groenbg = [UIImage imageNamed:@"hmi_degroenestad"];
        self.btnGroen = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnGroen.frame = CGRectMake(self.btnStil.frame.origin.x, self.btnStil.frame.origin.y + self.btnStil.frame.size.height + 40, groenbg.size.width - 20, groenbg.size.height - 20);
        [self.btnGroen setBackgroundImage:groenbg forState:UIControlStateNormal];
        self.btnGroen.alpha = 0.f;
        [self addSubview:self.btnGroen];
        
        // button: de kaart
        UIImage *kaartbg = [UIImage imageNamed:@"hmi_dekaart"];
        self.btnKaart = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnKaart.frame = CGRectMake(logoImageView.frame.origin.x, self.btnVriend.frame.origin.y + self.btnVriend.frame.size.height + 40, kaartbg.size.width - 20, kaartbg.size.height - 20);
        [self.btnKaart setBackgroundImage:kaartbg forState:UIControlStateNormal];
        self.btnKaart.alpha = 0.f;
        [self addSubview:self.btnKaart];
        
        // button: kleine opdrachten
        UIImage *opdrachtbg = [UIImage imageNamed:@"hmi_kleineopdrachten"];
        self.btnOpdracht = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnOpdracht.frame = CGRectMake(self.btnGroen.frame.origin.x, self.btnGroen.frame.origin.y + self.btnGroen.frame.size.height + 50, opdrachtbg.size.width - 20, opdrachtbg.size.height - 20);
        [self.btnOpdracht setBackgroundImage:opdrachtbg forState:UIControlStateNormal];
        self.btnOpdracht.alpha = 0.f;
        [self addSubview:self.btnOpdracht];
        
        // 1    TODO: alle menuitems in array -> overlopen met delay -> scale + opacity animeren
        
    }
    return self;
}

- (void)animateButton1:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        CGRect frame = self.btnStil.frame;
        frame.size.width += 20.0f;
        frame.size.height += 20.0f;
        frame.origin.y += 5;
        self.btnStil.frame = frame;
        self.btnStil.alpha = 1.0f;
    }completion:^(BOOL finished){}];
}

- (void)animateButton2:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f  animations:^{
        CGRect frame2 = self.btnVriend.frame;
        frame2.size.width += 20.0f;
        frame2.size.height += 20.0f;
        frame2.origin.y += 5;
        self.btnVriend.frame = frame2;
        self.btnVriend.alpha = 1.0f;
    }completion:^(BOOL finished){}];
}

- (void)animateButton3:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f  animations:^{
        CGRect frame3 = self.btnGroen.frame;
        frame3.size.width += 20.0f;
        frame3.size.height += 20.0f;
        frame3.origin.y += 5;
        self.btnGroen.frame = frame3;
        self.btnGroen.alpha = 1.0f;
    }completion:^(BOOL finished){}];
}

- (void)animateButton4:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        CGRect frame4 = self.btnKaart.frame;
        frame4.size.width += 20.0f;
        frame4.size.height += 20.0f;
        frame4.origin.y += 5;
        self.btnKaart.frame = frame4;
        self.btnKaart.alpha = 1.0f;
    }completion:^(BOOL finished){}];
}

- (void)animateButton5:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        CGRect frame5 = self.btnOpdracht.frame;
        frame5.size.width += 20.0f;
        frame5.size.height += 20.0f;
        frame5.origin.y -= 5;
        self.btnOpdracht.frame = frame5;
        self.btnOpdracht.alpha = 1.0f;
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
