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
    [self.loginView.txtCode addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.loginView.btnLogin addTarget:self action:@selector(loginButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginView.btn1 addTarget:self action:@selector(button1selected:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.btn2 addTarget:self action:@selector(button2selected:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.btn3 addTarget:self action:@selector(button3selected:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.btn4 addTarget:self action:@selector(button4selected:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.btn5 addTarget:self action:@selector(button5selected:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)textFieldDidChange:(id)sender
{
    NSLog(@"[LoginVC] Textfield did change");
    if ([self.loginView.txtCode.text isEqualToString:@"student"] ) {
        [self selectAGroup];
        for (UIView * txt in self.view.subviews){
            if ([txt isKindOfClass:[UITextField class]] && [txt isFirstResponder]) {
                [txt resignFirstResponder];
            }
        }
    }else if ([self.loginView.txtCode.text isEqualToString:@"leerkracht"] ) {
        [self selectAGroup];
        for (UIView * txt in self.view.subviews){
            if ([txt isKindOfClass:[UITextField class]] && [txt isFirstResponder]) {
                [txt resignFirstResponder];
            }
        }
    }
}

- (void)selectAGroup
{
    [self.loginView showGroupSelection];
}

- (void)button1selected:(id)sender
{
    NSLog(@"Group 1 selected");
    [self.loginView.btn1 setHighlighted:YES];
    [self.loginView showSaveButton];
    self.selectedgroup = 1;
}

- (void)button2selected:(id)sender
{
    NSLog(@"Group 2 selected");
    [self.loginView.btn2 setHighlighted:YES];
    [self.loginView showSaveButton];
    self.selectedgroup = 2;
}

- (void)button3selected:(id)sender
{
    NSLog(@"Group 3 selected");
    [self.loginView.btn3 setHighlighted:YES];
    [self.loginView showSaveButton];
    self.selectedgroup = 3;
}

- (void)button4selected:(id)sender
{
    NSLog(@"Group 4 selected");
    [self.loginView.btn4 setHighlighted:YES];
    [self.loginView showSaveButton];
    self.selectedgroup = 4;
}

- (void)button5selected:(id)sender
{
    NSLog(@"Group 5 selected");
    [self.loginView.btn5 setHighlighted:YES];
    [self.loginView showSaveButton];
    self.selectedgroup = 5;
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
    
    if ([self.loginView.txtCode.text isEqualToString:@"student"]) {
        NSLog(@"[LoginVC] Loging in with STUDENT, in group %i",self.selectedgroup);
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isUserLoggedIn"];
        [self dismissViewControllerAnimated:YES completion:^{}];
        [self.delegate userLoggedInWithType:@"STUDENT" AndGroup:self.selectedgroup];
    } else if ([self.loginView.txtCode.text isEqualToString:@"leerkracht"]) {
        NSLog(@"[LoginVC] Loging in with TEACHER, in group %i",self.selectedgroup);
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isUserLoggedIn"];
        [self dismissViewControllerAnimated:YES completion:^{}];
        [self.delegate userLoggedInWithType:@"TEACHER" AndGroup:self.selectedgroup];
    } else{
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
