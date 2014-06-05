//
//  MenuItem.h
//  EnRoute12
//
//  Created by Wout Thielemans on 03/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject

@property (nonatomic) int identifier;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UIColor *color;
@property (nonatomic) float width;
@property (nonatomic) float heigth;

@end
