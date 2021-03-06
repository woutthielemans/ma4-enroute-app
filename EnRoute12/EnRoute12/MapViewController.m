//
//  MapViewController.m
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.menuIsOut = NO;
    }
    return self;
}

- (id)initWithUser:(User *)user
{
    self.user = user;
    return [self initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mapView.delegate = self;
    
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.frame = CGRectMake(0, -100, self.mapView.frame.size.width, self.navigationController.navigationBar.frame.size.height);
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationItem.leftBarButtonItem = [self getBackButton];
    self.navigationItem.rightBarButtonItem = [self getMenuButton];
    
    [UIView animateWithDuration:0.7f animations:^{
        CGRect navframe = self.navigationController.navigationBar.frame;
        navframe.origin.y += 120;
        self.navigationController.navigationBar.frame = navframe;
    } completion:^(BOOL finished){}];
    
    NSString *path = @"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/api/spots";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Loaded JSON");
        NSArray *loadedData = (NSArray *)responseObject;
        NSLog(@"Loaded data: %@",loadedData);
        self.qspots = [NSMutableArray array];
        
        for (NSDictionary *dict in loadedData) {
            QuietSpot *qspot = [QuietSpotFactory createQuietSpotWithTitle:[dict objectForKey:@"title"] Subtitle:[dict objectForKey:@"subtitle"] Longitude:[dict objectForKey:@"longitude"] andLatitude:[dict objectForKey:@"latitude"]];
            [self.qspots addObject:qspot];
            [self.mapView updateWithSpots:self.qspots];
            NSLog(@"[MapVC] longitude: %@ and latitude: %@", [dict objectForKey:@"longitude"], [dict objectForKey:@"latitude"]);
            NSLog(@"[MapVC] Updated qspots with title:%@, subtitle: %@, longitude: %f and latitude: %f", qspot.title, qspot.subtitle, qspot.coordinate.longitude, qspot.coordinate.latitude);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error loading JSON");
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"error accessing api" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alerView show];
    }];
    [operation start];
}

- (UIBarButtonItem *) getBackButton
{
    NSLog(@"[MapVC] Get back button");
    self.btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backarrowmap = [UIImage imageNamed:@"backarrowmap"];
    [self.btnBack setFrame:CGRectMake(20,20,self.backarrowmap.size.width,self.backarrowmap.size.height)];
    [self.btnBack setImage:self.backarrowmap forState:UIControlStateNormal];
    [self.btnBack addTarget:self action:@selector(backButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.btnBack];
    return backBarButton;
}

- (void)backButtonTapped
{
    [UIView animateWithDuration:0.4f animations:^{
        CGRect navframe = self.navigationController.navigationBar.frame;
        navframe.origin.y -= 100;
        self.navigationController.navigationBar.frame = navframe;
    } completion:^(BOOL finished){
//        [self.navigationController popViewControllerAnimated:YES];
        [self dismissAll];
    }];
}

- (UIBarButtonItem *) getMenuButton
{
    self.btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    self.menubuttonmap = [UIImage imageNamed:@"menubuttonmap"];
    [self.btnMenu setFrame:CGRectMake(self.mapView.frame.size.width - 20,20,self.menubuttonmap.size.width,self.menubuttonmap.size.height)];
    [self.btnMenu setImage:self.menubuttonmap forState:UIControlStateNormal];
    [self.btnMenu addTarget:self action:@selector(menuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.btnMenu];
    return menuBarButton;
}

- (void)menuButtonTapped
{
    NSLog(@"[AssignmentVC] Menu is out: %hhd",self.menuIsOut);
    if (self.menuIsOut == NO) {
        
        [UIView animateWithDuration:0.4f animations:^{
            CGRect navframe = self.navigationController.navigationBar.frame;
            navframe.origin.y -= 100;
            self.navigationController.navigationBar.frame = navframe;
        } completion:^(BOOL finished){}];
        
        UIGraphicsBeginImageContext(self.mapView.bounds.size);
        [self.mapView.window.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *screenshot=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.menuVC = [[MenuViewController alloc] initWithScreenshot:screenshot AndCurrentPage:@"Map"];
        [self addChildViewController:self.menuVC];
        self.menuVC.delegate = self;
        self.menuVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:self.menuVC.view];
        [self.menuVC didMoveToParentViewController:self];
        self.menuIsOut = YES;
    }
}

- (void)menuDidQuit
{
    [UIView animateWithDuration:0.7f animations:^{
        CGRect navframe = self.navigationController.navigationBar.frame;
        navframe.origin.y += 100;
        self.navigationController.navigationBar.frame = navframe;
    } completion:^(BOOL finished){}];
    self.menuIsOut = NO;
}

- (void)buttonMenuWasTapped
{
    [self.menuVC willMoveToParentViewController:nil];
    [self.menuVC.view removeFromSuperview];
    [self.menuVC removeFromParentViewController];
    [self menuDidQuit];
    //    [self.navigationController popViewControllerAnimated:YES];
    [self dismissAll];
}

- (void)buttonNotificationsWasTapped
{
    [self.menuVC willMoveToParentViewController:nil];
    [self.menuVC.view removeFromSuperview];
    [self.menuVC removeFromParentViewController];
    [self menuDidQuit];
    NotificationsViewController *notVC = [[NotificationsViewController alloc] initWithUser:self.user];
    [self.navigationController pushViewController:notVC animated:YES];
}

- (void)dismissAll
{
    NSMutableArray *controllers = [self.navigationController.viewControllers mutableCopy];
    [controllers removeObjectsInRange:NSMakeRange(1, controllers.count-1)];
    self.navigationController.viewControllers = controllers;
}

- (void)loadView
{
    NSLog(@"[MapVC] Mapview loadview");
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.mapView = [[MapView alloc] initWithFrame:bounds AndUser:self.user];
    self.view = self.mapView;
    if(self.mapView == nil){
        NSLog(@"[MapVC] self.mapview nil");
    }
}

- (void)postTeacherLoc
{
    NSLog(@"[MapVC] POST JSON with teacher's current location");
    
    NSDictionary *params = @{@"groupid":  [NSString stringWithFormat:@"%i", self.user.groupid],
                             @"lon":  [NSString stringWithFormat:@"%f", self.mapView.teachercoor.latitude],
                             @"lat":  [NSString stringWithFormat:@"%f", self.mapView.teachercoor.longitude]};
    
    NSLog(@"[MapVC] params for posting teacher position: %@",params);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:@"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/api/teacherlocation" parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
         NSLog(@"RESPONSE %@", operation.responseObject);
     }];
}

- (void)getTeacherLoc
{
    NSLog(@"[MapVC] GET JSON with teacher's current location");
    
    NSString *path = @"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/api/teacherlocation";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *loadedData = (NSArray *)responseObject;
        
        for (NSDictionary *dict in loadedData) {
            int groupid = [[dict objectForKey:@"group_id"] intValue];
            NSString *longitudestring = [dict objectForKey:@"longitude"];
            double longitude = [longitudestring doubleValue];
            NSString *latitudestring = [dict objectForKey:@"latitude"];
            double latitude = [latitudestring doubleValue];
            CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(longitude, latitude);
            Teacher *teacher = [TeacherFactory createTeacherWithGroupId:groupid AndCoordinates:coordinate];
            [self.mapView createAnnotationWithTeacher:teacher];
            NSLog(@"[MapVC] Loaded JSON with teacher: latitude -> %f, longitude -> %f, group id -> %i",latitude,longitude,groupid);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error loading JSON");
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"error accessing api for teacher location" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alerView show];
    }];
    [operation start];
}

- (void)buttonMapWasTapped
{
    NSLog(@"Button map tapped");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
