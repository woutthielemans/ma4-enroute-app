//
//  MenuView.h
//  EnRoute12
//
//  Created by Wout Thielemans on 03/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"
#import "MenuItemFactory.h"

@interface MenuView : UIView

@property (strong, nonatomic) UIButton *mi1_button;
@property (strong, nonatomic) UIButton *mi2_button;
@property (strong, nonatomic) UIButton *mi3_button;
@property (nonatomic) int navBarHeight;

@end
