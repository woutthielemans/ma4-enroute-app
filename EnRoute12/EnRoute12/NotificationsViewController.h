//
//  NotificationsViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "Notification.h"
#import "NotificationFactory.h"
#import "NotificationsView.h"

@interface NotificationsViewController : UIViewController

@property (strong, nonatomic) NSMutableDictionary *notifications;
@property (strong, nonatomic) NotificationsView *notificationView;

@end
