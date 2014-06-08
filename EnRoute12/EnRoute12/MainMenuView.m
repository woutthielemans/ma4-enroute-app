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
        
        // Logo
        UIImage *logo = [UIImage imageNamed:@"hmi_homelogo"];
        UIImageView *logoImageView = [[UIImageView alloc] initWithImage:logo];
        logoImageView.frame = CGRectMake(20, 40, logo.size.width, logo.size.height);
        [self addSubview:logoImageView];
        
        // button: de stille stad
        UIImage *stilbg = [UIImage imageNamed:@"hmi_destillestad"];
        self.btnStil = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnStil.frame = CGRectMake(logoImageView.frame.origin.x + logoImageView.frame.size.width + 20, 40, stilbg.size.width, stilbg.size.height);
        [self.btnStil setBackgroundImage:stilbg forState:UIControlStateNormal];
        [self addSubview:self.btnStil];
        
        // button: de vriendelijke stad
        UIImage *vriendbg = [UIImage imageNamed:@"hmi_devriendelijkestad"];
        self.btnVriend = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnVriend.frame = CGRectMake(logoImageView.frame.origin.x, logoImageView.frame.origin.y + logoImageView.frame.size.height + 20, vriendbg.size.width, vriendbg.size.height);
        [self.btnVriend setBackgroundImage:vriendbg forState:UIControlStateNormal];
        [self addSubview:self.btnVriend];
        
        // button: de groene stad
        UIImage *groenbg = [UIImage imageNamed:@"hmi_degroenestad"];
        self.btnGroen = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnGroen.frame = CGRectMake(self.btnStil.frame.origin.x, self.btnStil.frame.origin.y + self.btnStil.frame.size.height + 20, groenbg.size.width, groenbg.size.height);
        [self.btnGroen setBackgroundImage:groenbg forState:UIControlStateNormal];
        [self addSubview:self.btnGroen];
        
        // button: de kaart
        UIImage *kaartbg = [UIImage imageNamed:@"hmi_dekaart"];
        self.btnKaart = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnKaart.frame = CGRectMake(logoImageView.frame.origin.x, self.btnVriend.frame.origin.y + self.btnVriend.frame.size.height + 20, kaartbg.size.width, kaartbg.size.height);
        [self.btnKaart setBackgroundImage:kaartbg forState:UIControlStateNormal];
        [self addSubview:self.btnKaart];
        
        // button: kleine opdrachten
        UIImage *opdrachtbg = [UIImage imageNamed:@"hmi_kleineopdrachten"];
        self.btnOpdracht = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnOpdracht.frame = CGRectMake(self.btnGroen.frame.origin.x, self.btnGroen.frame.origin.y + self.btnGroen.frame.size.height + 20, opdrachtbg.size.width, opdrachtbg.size.height);
        [self.btnOpdracht setBackgroundImage:opdrachtbg forState:UIControlStateNormal];
        [self addSubview:self.btnOpdracht];
        
        // 1    TODO: alle menuitems in array -> overlopen met delay -> scale + opacity animeren
        
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
