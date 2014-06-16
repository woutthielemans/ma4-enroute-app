//
//  LoginView.h
//  2DEV2_thielemanswout_ND_EXAMEN_MEI
//
//  Created by Wout Thielemans on 21/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

@property (strong, nonatomic) UIImageView *background;
@property (strong, nonatomic) UITextField *txtCode;
@property (strong, nonatomic) UIButton *btn1;
@property (strong, nonatomic) UIButton *btn2;
@property (strong, nonatomic) UIButton *btn3;
@property (strong, nonatomic) UIButton *btn4;
@property (strong, nonatomic) UIButton *btn5;
@property (strong, nonatomic) UIButton *btnLogin;
@property (strong, nonatomic) NSTimer *timerButton1;
@property (strong, nonatomic) UILabel *label;

- (void)btnErrorAnim;
- (void)showGroupSelection;
- (void)showSaveButton;

@end
