//
//  NotificatonBadgeFactory.m
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "NotificatonBadgeFactory.h"

@implementation NotificatonBadgeFactory

- (NotificationBadge *)createBadgeWithAmount:(int)amount Size:(int)size AndColor:(UIColor *)color
{
    NotificationBadge *notificationbadge = [[NotificationBadge alloc] init];
    notificationbadge.amount = amount;
    notificationbadge.size = size;
    notificationbadge.color = color;
    return notificationbadge;
}

@end
