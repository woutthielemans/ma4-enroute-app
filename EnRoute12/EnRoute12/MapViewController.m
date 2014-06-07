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
        self.title = @"Quiet spots";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    NSString *path = @"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/upload/api/spots";
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

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.mapView = [[MapView alloc] initWithFrame:bounds];
    self.view = self.mapView;
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
