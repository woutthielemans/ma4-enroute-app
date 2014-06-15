//
//  AssignmentsTableViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 03/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "Assignment.h"
#import "AssignmentFactory.h"
#import "AssignmentTableViewCell.h"
#import "AssignmentViewController.h"
#import "User.h"
#import "MenuViewController.h"
#import "MainMenuDelegate.h"

@interface AssignmentsTableViewController : UITableViewController <MenuDelegate>

@property (strong, nonatomic) NSMutableArray *assignments;
@property (weak ,nonatomic) id<MainMenuDelegate> delegate;
@property (strong, nonatomic) UIButton *btnBack;
@property (strong, nonatomic) UIButton *btnMenu;
@property (strong, nonatomic) UIImage *backarrow;
@property (strong, nonatomic) UIImage *menubutton;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) MenuViewController *menuVC;
@property (nonatomic) BOOL menuIsOut;

- (id)initWithUser:(User *)user;

@end
