//
//  MenuView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

- (id)initWithFrame:(CGRect)frame Screenshot:(UIImage *)screenshot AndCurrentPage:(NSString *)page
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.screenshot = screenshot;
        self.page = page;
        self.effectimage = [self.screenshot applyLightEffect];
        self.image = self.effectimage;
        UIFont *font = [UIFont fontWithName:PLUTO_SANS_REGULAR size:20];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:self.image];
        imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        imageView.alpha = 0.f;
        [self addSubview:imageView];
        [UIView animateWithDuration:0.3f animations:^{
            imageView.alpha = 1.0f;
        } completion:^(BOOL finished){}];
        
        UIImage *logoimage = [UIImage imageNamed:@"menulogo"];
        UIImageView *logo = [[UIImageView alloc] initWithImage:logoimage];
        logo.frame = CGRectMake(0, 0, logoimage.size.width, logoimage.size.height);
        logo.center = CGPointMake(self.frame.size.width/2, 90);
        logo.alpha = .8f;
        [self addSubview:logo];
        
        self.btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnMenu.frame = CGRectMake(0, 0, self.frame.size.width, 100);
        self.btnMenu.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2  + 30 - 80);
        [self.btnMenu setTitle:@"MENU" forState:UIControlStateNormal];
        [self.btnMenu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btnMenu.titleLabel.font = font;
        self.btnMenu.alpha = 0.8f;
        [self addSubview:self.btnMenu];
        
        self.btnMap = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnMap.frame = CGRectMake(0, 0, self.frame.size.width, 100);
        self.btnMap.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 + 30);
        [self.btnMap setTitle:@"KAART" forState:UIControlStateNormal];
        [self.btnMap setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btnMap.titleLabel.font = font;
        if ([self.page isEqualToString:@"Map"]){
            self.btnMap.alpha = 0.2f;
        }else{
             self.btnMap.alpha = 0.8f;
        }
        [self addSubview:self.btnMap];
        
        self.btnNotifications = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnNotifications.frame = CGRectMake(0, 0, self.frame.size.width, 100);
        self.btnNotifications.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 + 30 + 80);
        [self.btnNotifications setTitle:@"MELDINGEN" forState:UIControlStateNormal];
        [self.btnNotifications setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btnNotifications.titleLabel.font = font;
        if ([self.page isEqualToString:@"Notifications"]){
            self.btnNotifications.alpha = 0.2f;
        }else{
            self.btnNotifications.alpha = 0.8f;
        }
        [self addSubview:self.btnNotifications];
        UIImage *quitimage = [UIImage imageNamed:@"quitmenu"];
        self.btnQuit = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnQuit setBackgroundImage:quitimage forState:UIControlStateNormal];
        self.btnQuit.frame = CGRectMake(0, 0, quitimage.size.width, quitimage.size.height);
        self.btnQuit.center = CGPointMake(self.frame.size.width/2, self.frame.size.height + 50);
        self.btnQuit.alpha = 0.8f;
        [self addSubview:self.btnQuit];
        [UIView animateWithDuration:0.4f animations:^{
            CGRect btnframe = self.btnQuit.frame;
            btnframe.origin.y -= 100;
            self.btnQuit.frame = btnframe;
        } completion:^(BOOL finished){}];
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
