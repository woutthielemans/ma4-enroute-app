//
//  MapView.m
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MapView.h"

@implementation MapView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.mapView = [[MKMapView alloc] initWithFrame:frame];
        
        self.mapView.delegate = self;
        CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(50.829160, 3.264164);
        self.mapView.region = MKCoordinateRegionMakeWithDistance(centerCoordinate, 5000, 5000);
        
        self.mapView.showsUserLocation = YES;
        
        [self addSubview:self.mapView];
    }
    return self;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    QuietSpot *qspot = (QuietSpot *)annotation;
    NSString static *identifier = @"PinAnnotationView";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    
    if(!annotationView){
        NSLog(@"[MapView] Inside if(!annotationView) !!");
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
        annotationView.pinColor = MKPinAnnotationColorGreen;
        
    }
    
    annotationView.annotation = qspot;
    return annotationView;
}

- (void)updateWithSpots:(NSArray *)qspots{
    [self.mapView addAnnotations:qspots];
    NSLog(@"Number of qspots %lu",(unsigned long)qspots.count);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
