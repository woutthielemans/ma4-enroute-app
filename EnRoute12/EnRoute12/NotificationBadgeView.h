//
//  NotificationBadgeView.h
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotificationBadge.h"

@interface NotificationBadgeView : UIView

@property (strong, nonatomic) NotificationBadge *notificationbadge;

- (id)initWithFrame:(CGRect)frame AndNotificationBadge:(NotificationBadge *)notificationbadge;

@end
