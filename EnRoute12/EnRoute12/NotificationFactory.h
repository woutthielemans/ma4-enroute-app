//
//  NotificationFactory.h
//  EnRoute12
//
//  Created by Wout Thielemans on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Notification.h"

@interface NotificationFactory : NSObject

+ (Notification *)createNotificationWithIdentifier:(int)identifier Title:(NSString *)title Subtitle:(NSString *)subtitle GroupId:(int)groupid Time:(NSDate *)time AndText:(NSString *)text;


@end
