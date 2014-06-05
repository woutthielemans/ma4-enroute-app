//
//  MenuView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 03/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        MenuItem *mi1_map = [MenuItemFactory createMenuItemWithIdentifier:1 Title:@"Ontdek Zentrijk" Color:[UIColor redColor] Width:self.frame.size.width andHeight:((self.frame.size.height-64)/3)];
        MenuItem *mi2_asgmts = [MenuItemFactory createMenuItemWithIdentifier:2 Title:@"Opdrachten" Color:[UIColor greenColor] Width:self.frame.size.width andHeight:((self.frame.size.height-64)/3)];
        MenuItem *mi3_notfs = [MenuItemFactory createMenuItemWithIdentifier:3 Title:@"Meldingen" Color:[UIColor blueColor] Width:self.frame.size.width andHeight:((self.frame.size.height-64)/3)];

        self.mi1_button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.mi1_button.frame = CGRectMake(0, 0, mi1_map.width, mi1_map.heigth);
        self.mi1_button.center = CGPointMake(self.frame.size.width/2, 128);
        self.mi1_button.backgroundColor = mi1_map.color;
        [self.mi1_button setTitle:[NSString stringWithFormat:@"%@",mi1_map.title] forState:UIControlStateNormal];
        [self addSubview:self.mi1_button];
        
        self.mi2_button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.mi2_button.frame = CGRectMake(0, 0, mi2_asgmts.width, mi2_asgmts.heigth);
        self.mi2_button.center = CGPointMake(self.frame.size.width/2, 128 + self.mi1_button.frame.size.height);
        self.mi2_button.backgroundColor = mi2_asgmts.color;
        [self.mi2_button setTitle:[NSString stringWithFormat:@"%@",mi2_asgmts.title] forState:UIControlStateNormal];
        [self addSubview:self.mi2_button];
        
        self.mi3_button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.mi3_button.frame = CGRectMake(0, 0, mi3_notfs.width, mi3_notfs.heigth);
        self.mi3_button.center = CGPointMake(self.frame.size.width/2, 128*2 + self.mi2_button.frame.size.height);
        self.mi3_button.backgroundColor = mi3_notfs.color;
        [self.mi3_button setTitle:[NSString stringWithFormat:@"%@",mi3_notfs.title] forState:UIControlStateNormal];
        [self addSubview:self.mi3_button];

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
