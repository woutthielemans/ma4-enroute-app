//
//  Notification.h
//  EnRoute12
//
//  Created by Wout Thielemans on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notification : NSObject

@property (nonatomic) int identifier;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *hour;
@property (strong, nonatomic) NSString *subtitle;
@property (nonatomic) int groupid;
@property (strong, nonatomic) NSDate *time;
@property (strong, nonatomic) NSString *text;

@end
