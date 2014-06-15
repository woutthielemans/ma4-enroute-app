//
//  MainMenuViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 08/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <QuartzCore/QuartzCore.h>
#import "MainMenuView.h"
#import "MapViewController.h"
#import "AssignmentsTableViewController.h"
#import "NotificationsViewController.h"
#import "User.h"
#import "UserFactory.h"
#import "LoginViewController.h"

@interface MainMenuViewController : UIViewController

@property (strong, nonatomic) MainMenuView *mainMenuView;
@property (strong, nonatomic) NSMutableArray *cassignments;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) LoginViewController *loginVC;

@end
