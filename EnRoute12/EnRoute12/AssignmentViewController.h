//
//  AssignmentViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AssignmentView.h"
#import "Assignment.h"
#import "CameraViewController.h"
#import "VolumeCheckerViewController.h"
#import "VolumeCheckerDelegate.h"
#import "User.h"

@interface AssignmentViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, VolumeCheckerDelegate>

@property (strong, nonatomic) Assignment *assignment;
@property (strong, nonatomic) AssignmentView *asView;
@property (strong, nonatomic) UIButton *btnBack;
@property (strong, nonatomic) UIButton *btnMenu;
@property (strong, nonatomic) UIImage *backarrow;
@property (strong, nonatomic) UIImage *menubutton;
@property (strong, nonatomic) VolumeCheckerViewController *volumeCheckerVC;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) UIImage *uploadImage;

- (id)initWithAssignment:(Assignment *)assignment AndUser:(User *)user;

@end
