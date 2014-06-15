//
//  MapDelegate.h
//  EnRoute12
//
//  Created by Wout Thielemans on 14/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MapViewController;
@class MapView;

@protocol MapDelegate <NSObject>

@required
- (void)postTeacherLoc;
- (void)getTeacherLoc;

@end
