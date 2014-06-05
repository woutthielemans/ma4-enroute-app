//
//  AddQuietSpotViewController.m
//  VolumeChecker
//
//  Created by Wout Thielemans on 30/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "AddQuietSpotViewController.h"

@interface AddQuietSpotViewController ()

@end

@implementation AddQuietSpotViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [self.locationManager startUpdatingLocation];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.addQuietSpotView = [[AddQuietSpotView alloc] initWithFrame:bounds];
    self.view = self.addQuietSpotView;
    [self.addQuietSpotView.btnSave addTarget:self action:@selector(saveSpotTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)saveSpotTapped:(id)sender{
    NSLog(@"[AddQuietSpotVC] Save spot tapped");
    
    self.userlongitude = [NSNumber numberWithFloat:self.usercoor.longitude];
    self.userlatitude = [NSNumber numberWithFloat:self.usercoor.latitude];
    
    QuietSpot *qspot = [QuietSpotFactory createQuietSpotWithTitle:self.addQuietSpotView.txtTitle.text Subtitle:self.addQuietSpotView.txtSubtitle.text Longitude:self.userlongitude andLatitude:self.userlatitude];
    
    NSLog(@"Saved spot with title:'%@' and subtitle:'%@' at coordinates:(%@,%@)",self.addQuietSpotView.txtTitle.text,self.addQuietSpotView.txtSubtitle.text,self.userlongitude,self.userlatitude);
    
    [self.delegate addQuietSpotViewController:self didSaveSpot:qspot];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *userloc = [locations lastObject];
    self.usercoor = userloc.coordinate;
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
