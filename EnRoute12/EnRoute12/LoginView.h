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
@property (strong, nonatomic) UITextField *txtUsername;
@property (strong, nonatomic) UITextField *txtPassword;
@property (strong, nonatomic) UIButton *btnLogin;

- (void)btnErrorAnim;

@end
