//
//  AssignmentViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "AssignmentViewController.h"

@interface AssignmentViewController ()

@end

@implementation AssignmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[self navigationController] setNavigationBarHidden:NO animated:NO];
        self.title = [NSString stringWithFormat:@"%@",self.assignment.title];
        self.menuIsOut = NO;
    }
    return self;
}

- (id)initWithAssignment:(Assignment *)assignment AndUser:(User *)user
{
    self.assignment = assignment;
    self.user = user;
    return [self initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationItem.leftBarButtonItem = [self getBackButton];
    self.navigationItem.rightBarButtonItem = [self getMenuButton];
    [self.navigationController.navigationBar setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIFont fontWithName:PLUTO_SANS_LIGHT size:18],
      NSFontAttributeName, nil]];
    
    if (self.asView.assignment.type == 1) {
        self.navigationController.navigationBar.frame = CGRectMake(0, -100, self.asView.frame.size.width, self.navigationController.navigationBar.frame.size.height);
        [UIView animateWithDuration:0.7f animations:^{
            CGRect navframe = self.navigationController.navigationBar.frame;
            navframe.origin.y += 120;
            self.navigationController.navigationBar.frame = navframe;
        } completion:^(BOOL finished){}];
    }
    
    [self.asView.gphotobutton addTarget:self action:@selector(showCamera:) forControlEvents:UIControlEventTouchUpInside];
    [self.asView.gcheckbutton addTarget:self action:@selector(checkTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.asView.glistenbutton addTarget:self action:@selector(listenTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.asView.quotebutton addTarget:self action:@selector(quoteTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.asView.greenbutton addTarget:self action:@selector(greenTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.asView.volumebutton addTarget:self action:@selector(volumeTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
//    [self.asView animateIllustration];
}

- (UIBarButtonItem *) getBackButton
{
    NSLog(@"[MapVC] Get back button");
    self.btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backarrow = [UIImage imageNamed:@"backarrow"];
    [self.btnBack setFrame:CGRectMake(20,20,self.backarrow.size.width,self.backarrow.size.height)];
    [self.btnBack setImage:self.backarrow forState:UIControlStateNormal];
    [self.btnBack addTarget:self action:@selector(backButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.btnBack];
    return backBarButton;
}

- (void)backButtonTapped
{
    if(self.asView.assignment.categoryid == 1 && self.asView.assignment.type == 2){
        [UIView animateWithDuration:0.4f animations:^{
            CGRect frame = self.asView.gphotobutton.frame;
            frame.origin.y += 80;
            self.self.asView.gphotobutton.frame = frame;
            CGRect illframe = self.asView.illImageView.frame;
            illframe.size.width -= 100.0f;
            illframe.size.height -= 100.0f;
            illframe.origin.x += 50;
            illframe.origin.y += 50;
            self.asView.illImageView.frame = illframe;
            self.asView.illImageView.alpha = 0.f;
        } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
    }else if(self.asView.assignment.categoryid == 2 && self.asView.assignment.type == 2){
        [UIView animateWithDuration:0.4f animations:^{
            CGRect frame = self.asView.glistenbutton.frame;
            frame.origin.y += 80;
            self.self.asView.glistenbutton.frame = frame;
            CGRect illframe = self.asView.illImageView.frame;
            illframe.size.width -= 100.0f;
            illframe.size.height -= 100.0f;
            illframe.origin.x += 50;
            illframe.origin.y += 50;
            self.asView.illImageView.frame = illframe;
            self.asView.illImageView.alpha = 0.f;
        } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
    }else if(self.asView.assignment.categoryid == 3 && self.asView.assignment.type == 2){
        [UIView animateWithDuration:0.4f animations:^{
            CGRect frame = self.asView.gcheckbutton.frame;
            frame.origin.y += 80;
            self.self.asView.gcheckbutton.frame = frame;
            CGRect illframe = self.asView.illImageView.frame;
            illframe.size.width -= 100.0f;
            illframe.size.height -= 100.0f;
            illframe.origin.x += 50;
            illframe.origin.y += 50;
            self.asView.illImageView.frame = illframe;
            self.asView.illImageView.alpha = 0.f;
        } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
    }else if(self.asView.assignment.type == 1){
        if (self.asView.assignment.identifier == 1) {
            [UIView animateWithDuration:0.4f animations:^{
                CGRect frame = self.asView.volumebutton.frame;
                frame.origin.y += 80;
                self.self.asView.volumebutton.frame = frame;
                CGRect illframe = self.asView.illImageView.frame;
                illframe.size.width -= 100.0f;
                illframe.size.height -= 100.0f;
                illframe.origin.x += 50;
                illframe.origin.y += 50;
                self.asView.illImageView.frame = illframe;
                self.asView.illImageView.alpha = 0.f;
                CGRect navframe = self.navigationController.navigationBar.frame;
                navframe.origin.y -= 100;
                self.navigationController.navigationBar.frame = navframe;
            } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
        }else if (self.asView.assignment.identifier == 3) {
            [UIView animateWithDuration:0.4f animations:^{
                CGRect frame = self.asView.quotebutton.frame;
                frame.origin.y += 80;
                self.self.asView.quotebutton.frame = frame;
                CGRect illframe = self.asView.illImageView.frame;
                illframe.size.width -= 100.0f;
                illframe.size.height -= 100.0f;
                illframe.origin.x += 50;
                illframe.origin.y += 50;
                self.asView.illImageView.frame = illframe;
                self.asView.illImageView.alpha = 0.f;
                CGRect navframe = self.navigationController.navigationBar.frame;
                navframe.origin.y -= 100;
                self.navigationController.navigationBar.frame = navframe;
            } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
        }else if (self.asView.assignment.identifier == 4) {
            [UIView animateWithDuration:0.4f animations:^{
                CGRect frame = self.asView.greenbutton.frame;
                frame.origin.y += 80;
                self.self.asView.greenbutton.frame = frame;
                CGRect illframe = self.asView.illImageView.frame;
                illframe.size.width -= 100.0f;
                illframe.size.height -= 100.0f;
                illframe.origin.x += 50;
                illframe.origin.y += 50;
                self.asView.illImageView.frame = illframe;
                self.asView.illImageView.alpha = 0.f;
                CGRect navframe = self.navigationController.navigationBar.frame;
                navframe.origin.y -= 100;
                self.navigationController.navigationBar.frame = navframe;
            } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
        }
    }
}

- (UIBarButtonItem *)getMenuButton
{
    self.btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    self.menubutton = [UIImage imageNamed:@"menubutton"];
    [self.btnMenu setFrame:CGRectMake(self.view.frame.size.width - 20,20,self.menubutton.size.width,self.menubutton.size.height)];
    [self.btnMenu setImage:self.menubutton forState:UIControlStateNormal];
    [self.btnMenu addTarget:self action:@selector(menuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.btnMenu];
    return menuBarButton;
}

- (void)menuButtonTapped
{
    NSLog(@"[AssignmentVC] Menu is out: %hhd",self.menuIsOut);
    if (self.menuIsOut == NO) {
        
        [UIView animateWithDuration:0.4f animations:^{
            CGRect navframe = self.navigationController.navigationBar.frame;
            navframe.origin.y -= 100;
            self.navigationController.navigationBar.frame = navframe;
        } completion:^(BOOL finished){}];
        
        UIGraphicsBeginImageContext(self.asView.bounds.size);
        [self.asView.window.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *screenshot=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.menuVC = [[MenuViewController alloc] initWithScreenshot:screenshot AndCurrentPage:@"Assignment"];
        [self addChildViewController:self.menuVC];
        self.menuVC.delegate = self;
        self.menuVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:self.menuVC.view];
        [self.menuVC didMoveToParentViewController:self];
        self.menuIsOut = YES;
    }
}

- (void)menuDidQuit
{
    [UIView animateWithDuration:0.7f animations:^{
        CGRect navframe = self.navigationController.navigationBar.frame;
        navframe.origin.y += 100;
        self.navigationController.navigationBar.frame = navframe;
    } completion:^(BOOL finished){}];
    self.menuIsOut = NO;
}

- (void)buttonMenuWasTapped
{
    [self.menuVC willMoveToParentViewController:nil];
    [self.menuVC.view removeFromSuperview];
    [self.menuVC removeFromParentViewController];
    [self menuDidQuit];
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissAll];
}

- (void)buttonMapWasTapped
{
    [self.menuVC willMoveToParentViewController:nil];
    [self.menuVC.view removeFromSuperview];
    [self.menuVC removeFromParentViewController];
    [self menuDidQuit];
    MapViewController *mapVC = [[MapViewController alloc] initWithUser:self.user];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (void)buttonNotificationsWasTapped
{
    [self.menuVC willMoveToParentViewController:nil];
    [self.menuVC.view removeFromSuperview];
    [self.menuVC removeFromParentViewController];
    [self menuDidQuit];
    NotificationsViewController *notVC = [[NotificationsViewController alloc] initWithUser:self.user];
    [self.navigationController pushViewController:notVC animated:YES];
}

- (void)dismissAll
{
    NSMutableArray *controllers = [self.navigationController.viewControllers mutableCopy];
    [controllers removeObjectsInRange:NSMakeRange(1, controllers.count-1)];
    self.navigationController.viewControllers = controllers;
}

- (void)showCamera:(id)sender
{
    CameraViewController *cameraVC = [[CameraViewController alloc] initWithUser:self.user];
    [self.navigationController pushViewController:cameraVC animated:NO];
}

- (void)checkTapped:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)listenTapped:(id)sender
{
    NSLog(@"[AssignmentVC] Standard assignment listen tapped - type should not exist for standard a's, returning to TVC");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)volumeTapped:(id)sender
{
    self.volumeCheckerVC  =[[VolumeCheckerViewController alloc] initWithUser:self.user];
    self.volumeCheckerVC.delegate = self;
    [self.navigationController pushViewController:self.volumeCheckerVC animated:YES];
}

- (void)quoteTapped:(id)sender
{
    self.enterquoteVC = [[EnterQuoteViewController alloc] initWithUser:self.user];
//    self.enterquoteVC.delegate = self;
    [self.navigationController pushViewController:self.enterquoteVC animated:YES];
}

- (void)greenTapped:(id)sender
{
    self.greenscannerVC = [[GreenScannerViewController alloc] initWithUser:self.user];
    //    self.enterquoteVC.delegate = self;
    [self.navigationController pushViewController:self.greenscannerVC animated:YES];
}

- (void)spotSavedShowMap
{
    NSLog(@"[AssignemtVC] Spot saved, show map");
    [self.navigationController popViewControllerAnimated:NO];
    MapViewController *mapVC = [[MapViewController alloc] init];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.asView = [[AssignmentView alloc] initWithFrame:bounds andAssignment:self.assignment];
    self.view = self.asView;
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
