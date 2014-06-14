//
//  BudaSpot.h
//  EnRoute12
//
//  Created by Wout Thielemans on 14/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface BudaSpot : NSObject <MKAnnotation>

@property (nonatomic)CLLocationCoordinate2D coordinate;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *subtitle;

@end
