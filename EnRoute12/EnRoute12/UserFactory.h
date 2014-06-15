//
//  UserFactory.h
//  EnRoute12
//
//  Created by Wout Thielemans on 14/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserFactory : NSObject

+ (User *)createUserWithUserType:(NSString *)usertype AndGroupId:(int)groupid;

@end
