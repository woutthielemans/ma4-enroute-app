//
//  GreenScannerViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "GreenScannerView.h"
#import "User.h"
#import "MenuViewController.h"

@interface GreenScannerViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSCoding>

@property (strong, nonatomic) GreenScannerView *greenScannerView;
@property (strong, nonatomic) UIImagePickerController *picker;
@property (strong, nonatomic) NSTimer *updateTimer;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) UIButton *btnBack;
@property (strong, nonatomic) UIButton *btnMenu;
@property (strong, nonatomic) UIImage *backarrow;
@property (strong, nonatomic) UIImage *menubutton;

- (id)initWithUser:(User *)user;

@end
