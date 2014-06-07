//
//  AssignmentView.h
//  EnRoute12
//
//  Created by Wout Thielemans on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Assignment.h"

@interface AssignmentView : UIView

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;

- (id)initWithFrame:(CGRect)frame andAssignment:(Assignment *)assignment;

@end
