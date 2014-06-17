//
//  NotificationsView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "NotificationsView.h"

@implementation NotificationsView

- (id)initWithFrame:(CGRect)frame Notifications:(NSMutableDictionary *)notifications AndUser:(User *)user
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor purpleColor];
        self.user = user;
        
        if ([self.user.usertype isEqualToString:@"TEACHER"]) {
            NSLog(@"[NotificationView] User is teacher");
            
            self.addButton = [UIButton buttonWithType:UIButtonTypeSystem];
            self.addButton.frame = CGRectMake(0, 0, 100, 44);
            self.addButton.center = CGPointMake(self.frame.size.width/2, 120);
            [self addSubview:self.addButton];

        }else if ([self.user.usertype isEqualToString:@"STUDENT"]) {
            NSLog(@"[NotificationView] User is student");
        }
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
