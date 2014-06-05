//
//  AddQuietSpotView.h
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddQuietSpotView : UIView

@property (strong, nonatomic) UITextField *txtTitle;
@property (strong, nonatomic) UITextField *txtSubtitle;
@property (strong, nonatomic) UIButton *btnSave;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;

@end
