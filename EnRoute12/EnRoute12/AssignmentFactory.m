//
//  AssignmentFactory.m
//  EnRoute12
//
//  Created by Wout Thielemans on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "AssignmentFactory.h"

@implementation AssignmentFactory

+ (Assignment *)createAssignmentWithIdentifier:(int)identifier Type:(int)type CategoryId:(int)categoryid  Title:(NSString *)title IllustrationPath:(NSString *)illustrationpath AndText:(NSString *)text
{
    Assignment *sassignment = [[Assignment alloc] init];
    sassignment.identifier = identifier;
    sassignment.type = type;
    sassignment.categoryid = categoryid;
    sassignment.title = title;
    NSURL *sill = [NSURL URLWithString:[NSString stringWithFormat:@"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/illustrations/%@",illustrationpath]];
    NSData *dataill = [NSData dataWithContentsOfURL: sill];
    UIImage *illfromurl = [UIImage imageWithData: dataill];
    sassignment.illustration = illfromurl;
    sassignment.text = text;
    return sassignment;
}

@end
