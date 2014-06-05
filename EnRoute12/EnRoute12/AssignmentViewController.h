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

@interface AssignmentViewController : UIViewController

@property (strong, nonatomic) Assignment *assignment;

- (id)initWithAssignment:(Assignment *)assignment;

@end
