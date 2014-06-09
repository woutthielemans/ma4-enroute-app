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

@interface AssignmentViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) Assignment *assignment;
@property (strong, nonatomic) AssignmentView *asView;
@property (strong, nonatomic) UIButton *btnBack;
@property (strong, nonatomic) UIButton *btnMenu;
@property (strong, nonatomic) UIImage *backarrow;
@property (strong, nonatomic) UIImage *menubutton;

- (id)initWithAssignment:(Assignment *)assignment;

@end
