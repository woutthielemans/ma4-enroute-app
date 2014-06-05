//
//  AssignmentFactory.h
//  EnRoute12
//
//  Created by Wout Thielemans on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Assignment.h"

@interface AssignmentFactory : NSObject

+ (Assignment *)createAssignmentWithIdentifier:(int)identifier Type:(int)type Title:(NSString *)title Illustration1Path:(NSString *)illustration1path Illustration2Path:(NSString *)illustration2path Illustration3Path:(NSString *)illustration3path Text1:(NSString *)text1 Text2:(NSString *)text2 AndText3:(NSString *)text3;

@end
