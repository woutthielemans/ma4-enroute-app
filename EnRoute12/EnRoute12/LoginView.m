//
//  LoginView.m
//  2DEV2_thielemanswout_ND_EXAMEN_MEI
//
//  Created by Wout Thielemans on 21/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createBackground];
        [self createTextFields];
        [self createButton];
    }
    return self;
}

- (void)createBackground{
    
    self.background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login-bg"]];
    self.background.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self addSubview:self.background];
    
}

- (void)createTextFields{
    
    UIImage *background = [UIImage imageNamed:@"login-textfield-bg"];
    
    self.txtUsername = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 60, background.size.height)];
    self.txtUsername.placeholder = @"Username";
    self.txtUsername.frame = CGRectMake(self.background.frame.origin.x + 25, self.background.frame.origin.y + 25, self.txtUsername.frame.size.width, self.txtUsername.frame.size.height);
    self.txtUsername.background = background;
    [self addSubview:self.txtUsername];
    
    self.txtPassword = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 60, background.size.height)];
    self.txtPassword.placeholder = @"Password";
    self.txtPassword.frame = CGRectMake(self.background.frame.origin.x + 25, self.txtUsername.frame.origin.y + self.txtUsername.frame.size.height + 15, self.txtPassword.frame.size.width, self.txtPassword.frame.size.height);
    self.txtPassword.background = background;
    self.txtPassword.secureTextEntry = YES;
    [self addSubview:self.txtPassword];
    
}

- (void)createButton{
    
    self.btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnLogin.frame = CGRectMake(0, 0, self.frame.size.width - 60, 44);
    self.btnLogin.center = CGPointMake(self.frame.size.width/2, self.txtPassword.frame.origin.y + self.txtPassword.frame.size.height + 35);
    self.btnLogin.backgroundColor = [UIColor colorWithRed:166/255.0f green:236/255.0f blue:194/255.0f alpha:1];
    [self.btnLogin setTitle:@"Login" forState:UIControlStateNormal];
    [self addSubview:self.btnLogin];
}

- (void)btnErrorAnim{
    [UIView animateWithDuration:.6 animations:^{
        
        self.btnLogin.backgroundColor = [UIColor colorWithRed:243/255.0f green:159/255.0f blue:163/255.0f alpha:1];
        [UIView animateWithDuration:.6 animations:^{
            
            self.btnLogin.backgroundColor = [UIColor colorWithRed:166/255.0f green:236/255.0f blue:194/255.0f alpha:1];
            
        }];
        
    }];
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
