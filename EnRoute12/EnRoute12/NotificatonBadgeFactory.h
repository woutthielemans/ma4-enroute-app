//
//  NotificatonBadgeFactory.h
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NotificationBadge.h"

@interface NotificatonBadgeFactory : NSObject

- (NotificationBadge *)createBadgeWithAmount:(int)amount Size:(int)size AndColor:(UIColor *)color;

@end
