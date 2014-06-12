//
//  VolumeCheckerView.h
//  VolumeChecker
//
//  Created by Wout Thielemans on 29/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VolumeCheckerView : UIView

//@property (strong, nonatomic) UIButton *btnListen;
@property (strong, nonatomic) UILabel *listenLabel;
@property (strong, nonatomic) CALayer *listenLabelLayer;
@property (strong, nonatomic) UILabel *tapSomewhereLabel;
@property (strong, nonatomic) CALayer *tapSomewhereLabelLayer;

@end
