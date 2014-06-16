//
//  LoginDelegate.h
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoginDelegate <NSObject>

- (void)userLoggedInWithType:(NSString *)type AndGroup:(int)group;

@end
