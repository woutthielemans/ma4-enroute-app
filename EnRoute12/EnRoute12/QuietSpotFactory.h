//
//  QuietSpotFactory.h
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuietSpot.h"

@interface QuietSpotFactory : NSObject

+ (QuietSpot *)createQuietSpotWithTitle:(NSString *)title Subtitle:(NSString *)subtitle Longitude:(NSNumber *)longitude andLatitude:(NSNumber *)latitude;

@end
