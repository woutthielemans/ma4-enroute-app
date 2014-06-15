//
//  NotificationBadgeView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "NotificationBadgeView.h"

@implementation NotificationBadgeView

- (id)initWithFrame:(CGRect)frame AndNotificationBadge:(NotificationBadge *)notificationbadge
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.notificationbadge = notificationbadge;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
