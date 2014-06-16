//
//  MainMenuView.h
//  EnRoute12
//
//  Created by Wout Thielemans on 08/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainMenuView : UIView

@property (strong, nonatomic) NSMutableArray *menuItems;
@property (strong, nonatomic) UIButton *btnStil;
@property (strong, nonatomic) UIButton *btnVriend;
@property (strong, nonatomic) UIButton *btnGroen;
@property (strong, nonatomic) UIButton *btnKaart;
@property (strong, nonatomic) UIButton *btnOpdracht;
@property (strong, nonatomic) NSTimer *timerButton;

@end
