//
//  LoginViewController.h
//  2DEV2_thielemanswout_ND_EXAMEN_MEI
//
//  Created by Wout Thielemans on 21/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"

@interface LoginViewController : UIViewController

@property (strong, nonatomic) LoginView *loginView;
@property (nonatomic) CGRect bounds;

- (instancetype)initWithBounds:(CGRect)bounds;

@end
