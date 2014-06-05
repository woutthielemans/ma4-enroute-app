//
//  Assignment.h
//  EnRoute12
//
//  Created by Wout Thielemans on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Assignment : NSObject

@property (nonatomic) int identifier;
@property (nonatomic) int type;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UIImage *illustration1;
@property (strong, nonatomic) UIImage *illustration2;
@property (strong, nonatomic) UIImage *illustration3;
@property (strong, nonatomic) NSString *text1;
@property (strong, nonatomic) NSString *text2;
@property (strong, nonatomic) NSString *text3;

@end
