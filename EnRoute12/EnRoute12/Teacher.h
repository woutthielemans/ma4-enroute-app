//
//  Teacher.h
//  EnRoute12
//
//  Created by Wout Thielemans on 14/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Teacher : NSObject <MKAnnotation>

@property (nonatomic) int groupid;
@property (nonatomic)CLLocationCoordinate2D coordinate;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *subtitle;

@end
