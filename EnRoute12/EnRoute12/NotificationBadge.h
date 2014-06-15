//
//  NotificationBadge.h
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationBadge : NSObject

@property (nonatomic) int amount;
@property (nonatomic) int size;
@property (strong, nonatomic) UIColor *color;

@end
