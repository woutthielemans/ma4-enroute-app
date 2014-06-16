//
//  EnterQuoteViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EnterQuoteView.h"
#import "User.h"
#import "Quote.h"
#import "QuoteFactory.h"
#import "QuoteViewController.h"
#import "MenuViewController.h"
#import "MenuDelegate.h"
#import "MainMenuDelegate.h"
#import "MapViewController.h"
#import "NotificationsViewController.h"

@interface EnterQuoteViewController : UIViewController <MenuDelegate>

@property (strong, nonatomic) EnterQuoteView *enterquoteview;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) UIButton *btnBack;
@property (strong, nonatomic) UIButton *btnMenu;
@property (strong, nonatomic) UIImage *backarrow;
@property (strong, nonatomic) UIImage *menubutton;
@property (nonatomic) BOOL menuIsOut;
@property (strong, nonatomic) MenuViewController *menuVC;

- (id)initWithUser:(User *)user;

@end
