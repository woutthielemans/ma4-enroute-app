//
//  TeacherFactory.m
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "TeacherFactory.h"

@implementation TeacherFactory

+ (Teacher *)createTeacherWithGroupId:(int)groupid AndCoordinates:(CLLocationCoordinate2D)coordinate
{
    Teacher *teacher = [[Teacher alloc] init];
    teacher.groupid = groupid;
    teacher.coordinate = coordinate;
    return teacher;
}

@end
