//
//  UserFactory.m
//  EnRoute12
//
//  Created by Wout Thielemans on 14/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "UserFactory.h"

@implementation UserFactory

+ (User *)createUserWithUserType:(NSString *)usertype AndGroupId:(int)groupid
{
    User *user = [[User alloc] init];
    user.usertype = usertype;
    user.groupid = groupid;
    return user;
}

@end
