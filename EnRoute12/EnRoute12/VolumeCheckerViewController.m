//
//  VolumeCheckerViewController.m
//  VolumeChecker
//
//  Created by Wout Thielemans on 29/05/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "VolumeCheckerViewController.h"

@interface VolumeCheckerViewController ()

@end

@implementation VolumeCheckerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Listen";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.volumeCheckerView.btnListen addTarget:self action:@selector(listening:) forControlEvents:UIControlEventTouchDown];
    [self.volumeCheckerView.btnListen  addTarget:self action:@selector(stopListening:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)listening:(id)sender
{
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [audioSession setActive:YES error:nil];
    
    [audioSession requestRecordPermission:^(BOOL granted) {
        if (granted) {
            NSLog(@"[VolumeCheckerVC] Listen button being pressed");
            
            NSURL *url = [NSURL fileURLWithPath:@"dev/null"];
            
            NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [NSNumber numberWithFloat: 44100.0],                 AVSampleRateKey,
                                      [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
                                      [NSNumber numberWithInt: 1],                         AVNumberOfChannelsKey,
                                      [NSNumber numberWithInt: AVAudioQualityMax],         AVEncoderAudioQualityKey,
                                      nil];
            
            NSError *error = [[NSError alloc] init];
            
            self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
            
            if (self.audioRecorder) {
                [self.audioRecorder prepareToRecord];
                self.audioRecorder.meteringEnabled = YES;
                [self.audioRecorder record];
                self.levelTimer = [NSTimer scheduledTimerWithTimeInterval: 0.03 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
            } else
                NSLog(@"%@",[error description]);
        }
        else {
            NSLog(@"[VolumeCheckerVC] Microphone use not allowed by user");
        }
    }];
}

- (void)stopListening:(id)sender
{
    NSLog(@"[VolumeCheckerVC] Listen button released");
    [self stop];
}

- (void)levelTimerCallback:(NSTimer *)timer
{
    [self.audioRecorder updateMeters];
//	NSLog(@"Average input: %f Peak input: %f", [self.audioRecorder averagePowerForChannel:0], [self.audioRecorder peakPowerForChannel:0]);
//    if ([self.audioRecorder averagePowerForChannel:0] > -45) {
    // THIS IS THE TEST VALUE !!!! CHANGE TO -45 FOR LAUNCH
    if ([self.audioRecorder averagePowerForChannel:0] > 0) {
        NSLog(@"Not quiet enough, timer stopped: %f", [self.audioRecorder averagePowerForChannel:0]);
        if(self.acceptTimer){
            [self.acceptTimer invalidate];
            self.acceptTimer = nil;
        }
    }else{
        NSLog(@"Quite quiet! Timer running: %f", [self.audioRecorder averagePowerForChannel:0]);
        if(!self.acceptTimer){
            self.acceptTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target: self selector:@selector(acceptSpot:) userInfo: nil repeats:NO];
        }
    }
}

- (void)acceptSpot:(id)sender
{
    NSLog(@"It has been silent for over 5 seconds");
    [self stop];
    AddQuietSpotViewController *addQuietSpotVC = [[AddQuietSpotViewController alloc] init];
    addQuietSpotVC.delegate = self;
    [self presentViewController:addQuietSpotVC animated:YES completion:^{}];
}

- (void)stop{
    [self.acceptTimer invalidate];
    self.acceptTimer = nil;
    [self.levelTimer invalidate];
    self.levelTimer = nil;
    [self.audioRecorder stop];
    self.audioRecorder.meteringEnabled = NO;
    self.audioRecorder = nil;
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.volumeCheckerView = [[VolumeCheckerView alloc] initWithFrame:bounds];
    self.view = self.volumeCheckerView;
}

- (void)addQuietSpotViewController:(AddQuietSpotViewController *)addQuietSpotViewController didSaveSpot:(QuietSpot *)spot
{
    NSLog(@"[VolumeCheckerVC] Did save spot");
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"spot[title]": addQuietSpotViewController.addQuietSpotView.txtTitle,
                             @"spot[subtitle]": addQuietSpotViewController.addQuietSpotView.txtSubtitle,
                             @"spot[lon]": addQuietSpotViewController.userlongitude,
                             @"spot[lat]": addQuietSpotViewController.userlatitude};
    [manager POST:@"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/upload/uploadspot.php" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [addQuietSpotViewController dismissViewControllerAnimated:NO completion:^{}];
    MapViewController *mapVC = [[MapViewController alloc] init];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (void)uploadSpot
{
    NSLog(@"[VolumeCheckerVC] Uploading spot...");
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
