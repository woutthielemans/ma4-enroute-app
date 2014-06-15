//
//  MenuViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithScreenshot:(UIImage *)screenshot AndCurrentPage:(NSString *)page
{
    self.screenshot = screenshot;
    self.page = page;
    return [super initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.menuView.btnMenu addTarget:self action:@selector(menuTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView.btnMap addTarget:self action:@selector(mapTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView.btnNotifications addTarget:self action:@selector(notificationsTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)menuTapped:(id)sender
{
    [self.delegate buttonMenuWasTapped];
}

- (void)mapTapped:(id)sender
{
    [self.delegate buttonMapWasTapped];
}

- (void)notificationsTapped:(id)sender
{
    [self.delegate buttonNotificationsWasTapped];
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.menuView = [[MenuView alloc] initWithFrame:bounds Screenshot:self.screenshot AndCurrentPage:self.page];
    self.view = self.menuView;
    [self.menuView.btnQuit addTarget:self action:@selector(quitMenu:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)quitMenu:(id)sender
{
    [UIView animateWithDuration:0.3f animations:^{
        CGRect btnframe = self.menuView.btnQuit.frame;
        btnframe.origin.y += 100;
        self.menuView.btnQuit.frame = btnframe;
        self.menuView.alpha = 0.f;
    } completion:^(BOOL finished){}];
    [self.delegate menuDidQuit];
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
