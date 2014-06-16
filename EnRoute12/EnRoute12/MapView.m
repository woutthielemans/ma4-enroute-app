//
//  MapView.m
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MapView.h"

@implementation MapView

- (id)initWithFrame:(CGRect)frame AndUser:(User *)user
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.user = user;
        NSLog(@"User is of type: %@, and is part of group: %i",self.user.usertype,self.user.groupid);
        self.mapView = [[MKMapView alloc] initWithFrame:frame];
        
        self.mapView.delegate = self;
        CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(50.829160, 3.264164);
        self.mapView.region = MKCoordinateRegionMakeWithDistance(centerCoordinate, 2500, 2500);
        
        if ([CLLocationManager locationServicesEnabled]) {
            self.locationManager = [[CLLocationManager alloc] init];
            self.locationManager.delegate = self;
            
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            self.locationManager.distanceFilter = 1;
            self.locationManager.activityType = CLActivityTypeOther;
            
            [self.locationManager startUpdatingLocation];
            
            self.mapView.showsUserLocation = YES;
        }
        
        [self addSubview:self.mapView];
        
        if([self.user.usertype isEqualToString:@"TEACHER"]){
            [self.delegate postTeacherLoc];
            NSLog(@"[MapV] User is teacher");
            self.teacherLocPushTimer = [NSTimer scheduledTimerWithTimeInterval:60 target: self selector:@selector(pushTeacherLocation:) userInfo:nil repeats:YES];
        }else if([self.user.usertype isEqualToString:@"STUDENT"]){
            [self.delegate getTeacherLoc];
            NSLog(@"[MapV] User is student");
            self.teacherLocGetTimer = [NSTimer scheduledTimerWithTimeInterval:60 target: self selector:@selector(getTeacherLocation:) userInfo:nil repeats:YES];
        }
        
        self.budascoop = [[BudaSpot alloc] init];
        self.budascoop.coordinate = CLLocationCoordinate2DMake(50.830628, 3.264779);
        self.budascoop.title = @"Budaspot";
        self.budascoop.subtitle = @"de Budascoop";
        
        self.budafabriek = [[BudaSpot alloc] init];
        self.budafabriek.coordinate = CLLocationCoordinate2DMake(50.825612, 3.254336);
        self.budafabriek.title = @"Budaspot";
        self.budafabriek.subtitle = @"de Budafabriek";
        
        self.budatoren = [[BudaSpot alloc] init];
        self.budatoren.coordinate = CLLocationCoordinate2DMake(50.831129, 3.265842);
        self.budatoren.title = @"Budaspot";
        self.budatoren.subtitle = @"de Budatoren";
        
        self.budalab = [[BudaSpot alloc] init];
        self.budalab.coordinate = CLLocationCoordinate2DMake(50.831829, 3.263910);
        self.budalab.title = @"Budaspot";
        self.budalab.subtitle = @"het Budalab";
        
    }
    return self;
}

- (void)pushTeacherLocation:(NSTimer *)timer
{
    NSLog(@"[MapV] Ask to push teacher's new location");
    [self givenewtloc];
}

- (void)givenewtloc
{
    NSLog(@"[MapV] Pushing teacher's new location");
    [self.delegate postTeacherLoc];
}

- (void)getTeacherLocation:(NSTimer *)timer
{
    NSLog(@"[MapV] Ask to get teacher's new location");
    [self getnewtloc];
}

- (void)getnewtloc
{
    NSLog(@"[MapV] Getting teacher's new location");
    [self.delegate getTeacherLoc];
}

- (void)createAnnotationWithTeacher:(Teacher *)teacher
{
    [self.mapView removeAnnotation:self.teacher];
    self.teacher = nil;
    
    self.teacher = [[Teacher alloc] init];
    self.teacher.coordinate = teacher.coordinate;
    self.teacher.title = @"Leerkracht";
//    self.teacher.subtitle = [NSString stringWithFormat:@"Groepje %i",teacher.groupid];

    [self.mapView addAnnotation:self.teacher];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *teacherloc = [locations lastObject];
    self.teachercoor = teacherloc.coordinate;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    QuietSpot *qspot = (QuietSpot *)annotation;
    NSString static *identifier = @"AnnotationView";
    MKAnnotationView *annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    
    if(!annotationView){
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        annotationView.canShowCallout = YES;
//        annotationView.pinColor = MKPinAnnotationColorGreen;
        UIImage *customPinGreenSpot = [UIImage imageNamed:@"greenAnnotation"];
        UIImage *customPinBudaSpot = [UIImage imageNamed:@"budaAnnotation"];
        UIImage *customPinTeacherLocation = [UIImage imageNamed:@"customPinTeacherLocation"];
        if ([annotationView.annotation.title  isEqualToString:@"Budaspot"]) {
            annotationView.image = customPinBudaSpot;
        }else if([annotationView.annotation.title  isEqualToString:@"Leerkracht"]) {
            annotationView.image = customPinTeacherLocation;
        }else{
            annotationView.image = customPinGreenSpot;
            annotationView.centerOffset = CGPointMake(0, -customPinGreenSpot.size.height/2);
        }
    }
    
    annotationView.annotation = qspot;
    return annotationView;
}

- (void)updateWithSpots:(NSArray *)qspots{
    [self.mapView addAnnotations:qspots];
    NSLog(@"Number of qspots %lu",(unsigned long)qspots.count);
    [self.mapView addAnnotations:@[self.budascoop,self.budafabriek,self.budalab,self.budatoren]];
    if([self.user.usertype isEqualToString:@"TEACHER"]){
        [self.delegate postTeacherLoc];
    }else if([self.user.usertype isEqualToString:@"STUDENT"]){
        [self.delegate getTeacherLoc];
    }
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
