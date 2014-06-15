//
//  LoginViewController.m
//  2DEV2_thielemanswout_ND_EXAMEN_MEI
//
//  Created by Wout Thielemans on 21/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (instancetype)initWithBounds:(CGRect)bounds{
    self.bounds = bounds;
    return [self initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.loginView.btnLogin addTarget:self action:@selector(loginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UIView * txt in self.view.subviews){
        if ([txt isKindOfClass:[UITextField class]] && [txt isFirstResponder]) {
            [txt resignFirstResponder];
        }
    }
}

- (void)loginButtonTapped:(id)sender{
    NSLog(@"[LoginVC] Login button tapped");
    
    ///////////////////////////////////////////////////////////////////
    
    /*             USERNAME: 'test' PASSWORD: 'test'              */
    
    ///////////////////////////////////////////////////////////////////
    
    if([self.loginView.txtUsername.text isEqualToString:@"test"]
       && [self.loginView.txtPassword.text isEqualToString:@"test"] && ![self.loginView.txtUsername.text isEqual:@""] && ![self.loginView.txtPassword.text isEqual:@""]){
        NSLog(@"[LoginVC] Correct username and password");
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isUserLoggedIn"];
        
        [self dismissViewControllerAnimated:YES completion:^{}];
    }else{
        NSLog(@"[LoginVC] Incorrect/empty username and/or password");
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isUserLoggedIn"];
        [self.loginView btnErrorAnim];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loadView{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.loginView = [[LoginView alloc] initWithFrame:bounds];
    self.view = self.loginView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
