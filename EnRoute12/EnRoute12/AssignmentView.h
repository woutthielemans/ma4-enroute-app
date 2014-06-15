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

@property (strong, nonatomic) UIImage *illustration;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIButton *gphotobutton;
@property (strong, nonatomic) UIButton *glistenbutton;
@property (strong, nonatomic) UIButton *gcheckbutton;
@property (strong, nonatomic) UIButton *volumebutton;
@property (strong, nonatomic) UIButton *quotebutton;
@property (strong, nonatomic) UIButton *greenbutton;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *illImageView;
@property (nonatomic, strong) UIImageView *loadedPhoto;

- (id)initWithFrame:(CGRect)frame andAssignment:(Assignment *)assignment;
//- (void)animateIllustration;

@end
