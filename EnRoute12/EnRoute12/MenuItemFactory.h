//
//  MenuItemFactory.h
//  EnRoute12
//
//  Created by Wout Thielemans on 03/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItem.h"

@interface MenuItemFactory : NSObject

+ (MenuItem *)createMenuItemWithIdentifier:(int)identifier Title:(NSString *)title Color:(UIColor *)color Width:(float)width andHeight:(float)height;

@end
