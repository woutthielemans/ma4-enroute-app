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

@interface AssignmentsTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *assignments;

@end
