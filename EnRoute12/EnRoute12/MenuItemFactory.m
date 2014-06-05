//
//  MenuItemFactory.m
//  EnRoute12
//
//  Created by Wout Thielemans on 03/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MenuItemFactory.h"

@implementation MenuItemFactory

+ (MenuItem *)createMenuItemWithIdentifier:(int)identifier Title:(NSString *)title Color:(UIColor *)color Width:(float)width andHeight:(float)height
{
    MenuItem *mitem = [[MenuItem alloc] init];
    mitem.identifier = identifier;
    mitem.title = title;
    mitem.color = color;
    mitem.width = width;
    mitem.heigth = height;
    return mitem;
}

@end
