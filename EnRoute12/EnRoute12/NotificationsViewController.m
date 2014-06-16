//
//  NotificationsViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "NotificationsViewController.h"

@interface NotificationsViewController ()

@end

@implementation NotificationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSString *path = @"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/api/notifications";
        NSURL *url = [NSURL URLWithString:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSArray *loadedData = (NSArray *)responseObject;
            self.notifications = [NSMutableDictionary dictionary];
            
            for (NSDictionary *dict in loadedData) {
                int identifier = [[dict objectForKey:@"id"] intValue];
                int groupid = [[dict objectForKey:@"group_id"] intValue];
                Notification *notification = [NotificationFactory createNotificationWithIdentifier:identifier Title:[dict objectForKey:@"title"] Subtitle:[dict objectForKey:@"subtitle"] GroupId:groupid Time:[dict objectForKey:@"time"] AndText:[dict objectForKey:@"text"]];
                [self.notifications setObject:notification forKey:[dict objectForKey:@"title"]];
                NSLog(@"[NotificationsVC] Notification added: %i - %@ at %@",notification.identifier,notification.title,notification.time);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error loading JSON");
            UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"error accessing api for assignments" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alerView show];
        }];
        [operation start];
        
        for (Notification *notfn in self.notifications) {
            NSLog(@"[NotificationVC] Notificaion title: %@ and hour: %@",notfn.title,notfn.hour);
        }
    }
    return self;
}

- (id)initWithUser:(User *)user
{
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
      [UIFont fontWithName:PLUTO_SANS_LIGHT size:21],
      NSFontAttributeName, nil]];
    self.title = @"Meldingen";
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.notificationView = [[NotificationsView alloc] initWithFrame:bounds Notifications:self.notifications AndUser:self.user];
    self.view = self.notificationView;
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
    [self.navigationController popViewControllerAnimated:YES];
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
        
        UIGraphicsBeginImageContext(self.notificationView.bounds.size);
        [self.notificationView.window.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *screenshot=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.menuVC = [[MenuViewController alloc] initWithScreenshot:screenshot AndCurrentPage:@"Notifications"];
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

- (void)dismissAll
{
    NSMutableArray *controllers = [self.navigationController.viewControllers mutableCopy];
    [controllers removeObjectsInRange:NSMakeRange(1, controllers.count-1)];
    self.navigationController.viewControllers = controllers;
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
