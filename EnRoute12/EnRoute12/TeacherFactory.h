//
//  TeacherFactory.h
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Teacher.h"

@interface TeacherFactory : NSObject

+ (Teacher *)createTeacherWithGroupId:(int)groupid AndCoordinates:(CLLocationCoordinate2D)coordinate;

@end
