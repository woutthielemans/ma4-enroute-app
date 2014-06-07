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
        UIButton *btnStil = [UIButton buttonWithType:UIButtonTypeCustom];
        btnStil.frame = CGRectMake(logoImageView.frame.origin.x + logoImageView.frame.size.width + 20, 40, stilbg.size.width, stilbg.size.height);
        [btnStil setBackgroundImage:stilbg forState:UIControlStateNormal];
        [self addSubview:btnStil];
        
        // button: de vriendelijke stad
        UIImage *vriendbg = [UIImage imageNamed:@"hmi_devriendelijkestad"];
        UIButton *btnVriend = [UIButton buttonWithType:UIButtonTypeCustom];
        btnVriend.frame = CGRectMake(logoImageView.frame.origin.x, logoImageView.frame.origin.y + logoImageView.frame.size.height + 20, vriendbg.size.width, vriendbg.size.height);
        [btnVriend setBackgroundImage:vriendbg forState:UIControlStateNormal];
        [self addSubview:btnVriend];
        
        // button: de groene stad
        UIImage *groenbg = [UIImage imageNamed:@"hmi_degroenestad"];
        UIButton *btnGroen = [UIButton buttonWithType:UIButtonTypeCustom];
        btnGroen.frame = CGRectMake(btnStil.frame.origin.x, btnStil.frame.origin.y + btnStil.frame.size.height + 20, groenbg.size.width, groenbg.size.height);
        [btnGroen setBackgroundImage:groenbg forState:UIControlStateNormal];
        [self addSubview:btnGroen];
        
        // button: de kaart
        UIImage *kaartbg = [UIImage imageNamed:@"hmi_dekaart"];
        UIButton *btnKaart = [UIButton buttonWithType:UIButtonTypeCustom];
        btnKaart.frame = CGRectMake(logoImageView.frame.origin.x, btnVriend.frame.origin.y + btnVriend.frame.size.height + 20, kaartbg.size.width, kaartbg.size.height);
        [btnKaart setBackgroundImage:kaartbg forState:UIControlStateNormal];
        [self addSubview:btnKaart];
        
        // button: kleine opdrachten
        UIImage *opdrachtbg = [UIImage imageNamed:@"hmi_kleineopdrachten"];
        UIButton *btnOpdracht = [UIButton buttonWithType:UIButtonTypeCustom];
        btnOpdracht.frame = CGRectMake(btnGroen.frame.origin.x, btnGroen.frame.origin.y + btnGroen.frame.size.height + 20, opdrachtbg.size.width, opdrachtbg.size.height);
        [btnOpdracht setBackgroundImage:opdrachtbg forState:UIControlStateNormal];
        [self addSubview:btnOpdracht];
        
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
