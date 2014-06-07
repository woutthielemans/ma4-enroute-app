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

@interface AssignmentViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) Assignment *assignment;
@property (strong, nonatomic) AssignmentView *asView;

- (id)initWithAssignment:(Assignment *)assignment;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

@end
