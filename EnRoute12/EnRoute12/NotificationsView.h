//
//  NotificationsView.h
//  EnRoute12
//
//  Created by Wout Thielemans on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface NotificationsView : UIView

- (id)initWithFrame:(CGRect)frame Notifications:(NSMutableDictionary *)notifications AndUser:(User *)user;

@end
