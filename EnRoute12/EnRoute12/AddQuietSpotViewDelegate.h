//
//  AddQuietSpotViewDelegate.h
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AddQuietSpotViewController;
#import "QuietSpot.h"

@protocol AddQuietSpotViewDelegate <NSObject>

- (void)addQuietSpotViewController:(AddQuietSpotViewController *)addQuietSpotViewController didSaveSpot:(QuietSpot *)spot;

@end
