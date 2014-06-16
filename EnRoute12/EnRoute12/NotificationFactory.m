//
//  NotificationFactory.m
//  EnRoute12
//
//  Created by Wout Thielemans on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "NotificationFactory.h"

@implementation NotificationFactory

+ (Notification *)createNotificationWithIdentifier:(int)identifier Title:(NSString *)title Subtitle:(NSString *)subtitle GroupId:(int)groupid Time:(NSDate *)time AndText:(NSString *)text
{
    Notification *notification = [[Notification alloc] init];
    notification.identifier = identifier;
    notification.title = title;
    notification.subtitle = subtitle;
    notification.groupid = groupid;
    notification.time = time;
    notification.text = text;
    return notification;
}

+ (Notification *)createNotificationWithIdentifier:(int)identifier Title:(NSString *)title AndHour:(NSString *)hour
{
    Notification *notification = [[Notification alloc] init];
    notification.identifier = identifier;
    notification.hour = hour;
    return notification;
}

@end
