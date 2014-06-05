//
//  AppDelegate.h
//  EnRoute12
//
//  Created by Wout Thielemans on 02/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MenuViewController *menuVC;
@property (strong, nonatomic) UINavigationController *navController;

@end
