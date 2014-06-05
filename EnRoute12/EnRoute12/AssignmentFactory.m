//
//  AssignmentFactory.m
//  EnRoute12
//
//  Created by Wout Thielemans on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "AssignmentFactory.h"

@implementation AssignmentFactory

+ (Assignment *)createAssignmentWithIdentifier:(int)identifier Type:(int)type Title:(NSString *)title Illustration1Path:(NSString *)illustration1path Illustration2Path:(NSString *)illustration2path Illustration3Path:(NSString *)illustration3path Text1:(NSString *)text1 Text2:(NSString *)text2 AndText3:(NSString *)text3{
 
    Assignment *assignment = [[Assignment alloc] init];
    assignment.identifier = identifier;
    assignment.type = type;
    assignment.title = title;
    NSURL *ill1url = [NSURL URLWithString:[NSString stringWithFormat:@"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/illustrations/%@",illustration1path]];
    NSData *data1 = [NSData dataWithContentsOfURL: ill1url];
    UIImage *ill1 = [UIImage imageWithData: data1];
    assignment.illustration1 = ill1;
    NSURL *ill2url = [NSURL URLWithString:[NSString stringWithFormat:@"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/illustrations/%@",illustration2path]];
    NSData *data2 = [NSData dataWithContentsOfURL: ill2url];
    UIImage *ill2 = [UIImage imageWithData: data2];
    assignment.illustration2 = ill2;
    NSURL *ill3url = [NSURL URLWithString:[NSString stringWithFormat:@"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/illustrations/%@",illustration3path]];
    NSData *data3 = [NSData dataWithContentsOfURL: ill3url];
    UIImage *ill3 = [UIImage imageWithData: data3];
    assignment.illustration1 = ill3;
    assignment.text1 = text1;
    assignment.text2 = text2;
    assignment.text3 = text3;
    return assignment;
    
}

@end
