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
        self.backgroundColor = [UIColor colorWithRed:171/255.0f green:221/255.0f blue:198/255.0f alpha:1];
        
        UIImage *borderimage = [UIImage imageNamed:@"customcameraoverlay"];
        UIImageView *borderimageView = [[UIImageView alloc] initWithImage:borderimage];
        borderimageView.frame = CGRectMake(0, 0, borderimage.size.width, borderimage.size.height);
        borderimageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:borderimageView];
        
        UIImage *logoimage = [UIImage imageNamed:@"hmi_homelogo"];
        UIImageView *logoimageView = [[UIImageView alloc] initWithImage:logoimage];
        logoimageView.frame = CGRectMake(0, 0, logoimage.size.width, logoimage.size.height);
        logoimageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 120);
        [self addSubview:logoimageView];
        
        UIImage *tfbgimage = [UIImage imageNamed:@"textfield380"];
        UIImageView *tfbgimageview = [[UIImageView alloc] initWithImage:tfbgimage];
        tfbgimageview.frame = CGRectMake(0, 0, tfbgimage.size.width, tfbgimage.size.height);
        tfbgimageview.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:tfbgimageview];
        
        self.txtCode = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, tfbgimageview.frame.size.width, 35)];
        self.txtCode.center = CGPointMake(tfbgimageview.frame.origin.x + tfbgimageview.frame.size.width/2, self.frame.size.height/2);
        self.txtCode.backgroundColor = [UIColor clearColor];
        self.txtCode.textAlignment = NSTextAlignmentCenter;
        self.txtCode.secureTextEntry = YES;
        [self addSubview:self.txtCode];
        
        self.label = [[UILabel alloc] init];
        self.label.frame = CGRectMake(tfbgimageview.frame.origin.x, tfbgimageview.frame.origin.y + 30 + self.label.frame.size.height, 190, 50);
        self.label.text = @"Kies een groepje";
        self.label.font = [UIFont fontWithName:PLUTO_SANS_LIGHT size:16];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.alpha = 0.f;
        [self addSubview:self.label];
        
        UIImage *button1normal = [UIImage imageNamed:@"group1normal"];
        UIImage *button1selected = [UIImage imageNamed:@"group1selected"];
        self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn1.frame = CGRectMake(self.label.frame.origin.x + 6, self.label.frame.origin.y + button1normal.size.height + 10 + 100, button1normal.size.width, button1normal.size.height);
        [self.btn1 setBackgroundImage:button1normal forState:UIControlStateNormal];
        [self.btn1 setBackgroundImage:button1selected forState:UIControlStateHighlighted];
        [self.btn1 setBackgroundImage:button1selected forState:UIControlStateSelected];
        self.btn1.alpha = 0.f;
        [self addSubview:self.btn1];
        
        UIImage *button2normal = [UIImage imageNamed:@"group2normal"];
        UIImage *button2selected = [UIImage imageNamed:@"group2selected"];
        self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn2.frame = CGRectMake(self.btn1.frame.origin.x + 4 + button1normal.size.width, self.label.frame.origin.y + button1normal.size.height + 10 + 100, button1normal.size.width, button1normal.size.height);
        [self.btn2 setBackgroundImage:button2normal forState:UIControlStateNormal];
        [self.btn2 setBackgroundImage:button2selected forState:UIControlStateHighlighted];
        [self.btn2 setBackgroundImage:button2selected forState:UIControlStateSelected];
        self.btn2.alpha = 0.f;
        [self addSubview:self.btn2];
        
        UIImage *button3normal = [UIImage imageNamed:@"group3normal"];
        UIImage *button3selected = [UIImage imageNamed:@"group3selected"];
        self.btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn3.frame = CGRectMake(self.btn2.frame.origin.x + 4 + button1normal.size.width, self.label.frame.origin.y + button1normal.size.height + 10 + 100, button1normal.size.width, button1normal.size.height);
        [self.btn3 setBackgroundImage:button3normal forState:UIControlStateNormal];
        [self.btn3 setBackgroundImage:button3selected forState:UIControlStateHighlighted];
        [self.btn3 setBackgroundImage:button3selected forState:UIControlStateSelected];
        self.btn3.alpha = 0.f;
        [self addSubview:self.btn3];
        
        UIImage *button4normal = [UIImage imageNamed:@"group4normal"];
        UIImage *button4selected = [UIImage imageNamed:@"group4selected"];
        self.btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn4.frame = CGRectMake(self.btn3.frame.origin.x + 4 + button1normal.size.width, self.label.frame.origin.y + button1normal.size.height + 10 + 100, button1normal.size.width, button1normal.size.height);
        [self.btn4 setBackgroundImage:button4normal forState:UIControlStateNormal];
        [self.btn4 setBackgroundImage:button4selected forState:UIControlStateHighlighted];
        [self.btn4 setBackgroundImage:button4selected forState:UIControlStateSelected];
        self.btn4.alpha = 0.f;
        [self addSubview:self.btn4];
        
        UIImage *button5normal = [UIImage imageNamed:@"group5normal"];
        UIImage *button5selected = [UIImage imageNamed:@"group5selected"];
        self.btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btn5.frame = CGRectMake(self.btn4.frame.origin.x + 4 + button1normal.size.width, self.label.frame.origin.y + button1normal.size.height + 10 + 100, button1normal.size.width, button1normal.size.height);
        [self.btn5 setBackgroundImage:button5normal forState:UIControlStateNormal];
        [self.btn5 setBackgroundImage:button5selected forState:UIControlStateHighlighted];
        [self.btn5 setBackgroundImage:button5selected forState:UIControlStateSelected];
        self.btn5.alpha = 0.f;
        [self addSubview:self.btn5];
        
        UIImage *gobutton = [UIImage imageNamed:@"go"];
        self.btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnLogin.frame = CGRectMake(0, 0, gobutton.size.width, gobutton.size.height);
        self.btnLogin.center = CGPointMake(self.frame.size.width/2, self.btn1.frame.origin.y);
        [self.btnLogin setBackgroundImage:gobutton forState:UIControlStateNormal];
        self.btnLogin.alpha = 0.f;
        [self addSubview:self.btnLogin];
    }
    return self;
}

- (void)showSaveButton
{
    [UIView animateWithDuration:0.6f animations:^{
        
        self.btnLogin.alpha = 1.0f;
        
    }completion:^(BOOL finished){}];
}

- (void)showGroupSelection
{
    self.timerButton1 = [NSTimer scheduledTimerWithTimeInterval:0.1 target: self selector:@selector(animateButton1:) userInfo:nil repeats:NO];
    self.timerButton1 = [NSTimer scheduledTimerWithTimeInterval:0.3 target: self selector:@selector(animateButton2:) userInfo:nil repeats:NO];
    self.timerButton1 = [NSTimer scheduledTimerWithTimeInterval:0.5 target: self selector:@selector(animateButton3:) userInfo:nil repeats:NO];
    self.timerButton1 = [NSTimer scheduledTimerWithTimeInterval:0.7 target: self selector:@selector(animateButton4:) userInfo:nil repeats:NO];
    self.timerButton1 = [NSTimer scheduledTimerWithTimeInterval:0.9 target: self selector:@selector(animateButton5:) userInfo:nil repeats:NO];
    
    [UIView animateWithDuration:0.6f animations:^{self.label.alpha = 1.0f;}completion:^(BOOL finished){}];

}

- (void)animateButton1:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        
        CGRect btn1frame = self.btn1.frame;
        btn1frame.origin.y -= 100;
        self.btn1.frame = btn1frame;
        self.btn1.alpha = 1.0f;
        
    }completion:^(BOOL finished){}];
}

- (void)animateButton2:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        
        CGRect btn2frame = self.btn2.frame;
        btn2frame.origin.y -= 100;
        self.btn2.frame = btn2frame;
        self.btn2.alpha = 1.0f;
        
    }completion:^(BOOL finished){}];
}

- (void)animateButton3:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        
        CGRect btn3frame = self.btn3.frame;
        btn3frame.origin.y -= 100;
        self.btn3.frame = btn3frame;
        self.btn3.alpha = 1.0f;
        
    }completion:^(BOOL finished){}];
}

- (void)animateButton4:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        
        CGRect btn4frame = self.btn4.frame;
        btn4frame.origin.y -= 100;
        self.btn4.frame = btn4frame;
        self.btn4.alpha = 1.0f;
        
    }completion:^(BOOL finished){}];
}

- (void)animateButton5:(NSTimer *)timer
{
    [UIView animateWithDuration:0.6f animations:^{
        
        CGRect btn5frame = self.btn5.frame;
        btn5frame.origin.y -= 100;
        self.btn5.frame = btn5frame;
        self.btn5.alpha = 1.0f;
        
    }completion:^(BOOL finished){}];
}

- (void)btnErrorAnim
{
    
}


//
//- (void)createBackground{
//    
//    self.background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login-bg"]];
//    self.background.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
//    [self addSubview:self.background];
//    
//}
//
//- (void)createTextFields{
//    
//    UIImage *background = [UIImage imageNamed:@"login-textfield-bg"];
//    
//    self.txtUsername = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 60, background.size.height)];
//    self.txtUsername.placeholder = @"Username";
//    self.txtUsername.frame = CGRectMake(self.background.frame.origin.x + 25, self.background.frame.origin.y + 25, self.txtUsername.frame.size.width, self.txtUsername.frame.size.height);
//    self.txtUsername.background = background;
//    [self addSubview:self.txtUsername];
//    
//    self.txtPassword = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width - 60, background.size.height)];
//    self.txtPassword.placeholder = @"Password";
//    self.txtPassword.frame = CGRectMake(self.background.frame.origin.x + 25, self.txtUsername.frame.origin.y + self.txtUsername.frame.size.height + 15, self.txtPassword.frame.size.width, self.txtPassword.frame.size.height);
//    self.txtPassword.background = background;
//    self.txtPassword.secureTextEntry = YES;
//    [self addSubview:self.txtPassword];
//    
//}
//
//- (void)createButton{
//    
//    self.btnLogin = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.btnLogin.frame = CGRectMake(0, 0, self.frame.size.width - 60, 44);
//    self.btnLogin.center = CGPointMake(self.frame.size.width/2, self.txtPassword.frame.origin.y + self.txtPassword.frame.size.height + 35);
//    self.btnLogin.backgroundColor = [UIColor colorWithRed:166/255.0f green:236/255.0f blue:194/255.0f alpha:1];
//    [self.btnLogin setTitle:@"Login" forState:UIControlStateNormal];
//    [self addSubview:self.btnLogin];
//}
//
//- (void)btnErrorAnim{
//    [UIView animateWithDuration:.6 animations:^{
//        
//        self.btnLogin.backgroundColor = [UIColor colorWithRed:243/255.0f green:159/255.0f blue:163/255.0f alpha:1];
//        [UIView animateWithDuration:.6 animations:^{
//            
//            self.btnLogin.backgroundColor = [UIColor colorWithRed:166/255.0f green:236/255.0f blue:194/255.0f alpha:1];
//            
//        }];
//        
//    }];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
