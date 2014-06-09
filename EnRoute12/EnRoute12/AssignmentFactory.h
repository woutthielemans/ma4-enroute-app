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

+ (Assignment *)createAssignmentWithIdentifier:(int)identifier Type:(int)type CategoryId:(int)categoryid  Title:(NSString *)title IllustrationPath:(NSString *)illustrationpath AndText:(NSString *)text;

@end
