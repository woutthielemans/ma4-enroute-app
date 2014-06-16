//
//  NotificationsViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "Notification.h"
#import "NotificationFactory.h"
#import "NotificationsView.h"
#import "MainMenuDelegate.h"
#import "MenuViewController.h"
#import "MenuDelegate.h"
#import "User.h"
#import "MapViewController.h"

@interface NotificationsViewController : UIViewController <MenuDelegate>

@property (strong, nonatomic) NSMutableDictionary *notifications;
@property (weak ,nonatomic) id<MainMenuDelegate> delegate;
@property (strong, nonatomic) NotificationsView *notificationView;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) UIButton *btnBack;
@property (strong, nonatomic) UIButton *btnMenu;
@property (strong, nonatomic) UIImage *backarrow;
@property (strong, nonatomic) UIImage *menubutton;
@property (nonatomic) BOOL menuIsOut;
@property (strong, nonatomic) MenuViewController *menuVC;

- (id)initWithUser:(User *)user;

@end
