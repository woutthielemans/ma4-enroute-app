//
//  QuoteCameraOverlayView.h
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quote.h"

@interface QuoteCameraOverlayView : UIView

@property (strong, nonatomic) UILabel *quoteoverlay;

- (id)initWithFrame:(CGRect)frame AndQuote:(Quote *)quote;

@end
