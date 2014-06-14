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
        [[self navigationController] setNavigationBarHidden:NO animated:NO];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                      forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        self.navigationController.navigationBar.translucent = YES;
        self.navigationItem.leftBarButtonItem = [self getBackButton];
        self.navigationItem.rightBarButtonItem = [self getMenuButton];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(listening)
                                                     name:@"StartListeningForDBs"
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(stopListening)
                                                     name:@"StopListeningForDBs"
                                                   object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.volumeCheckerView.btnListen addTarget:self action:@selector(listening:) forControlEvents:UIControlEventTouchDown];
//    [self.volumeCheckerView.btnListen  addTarget:self action:@selector(stopListening:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)listening/*:(id)sender*/
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

- (void)stopListening/*:(id)sender*/
{
    NSLog(@"[VolumeCheckerVC] Listen button released");
    [self stop];
}

- (void)levelTimerCallback:(NSTimer *)timer
{
    [self.audioRecorder updateMeters];
    [self.volumeCheckerView drawCircle:self.volumeCheckerView.circleLayer WithLoudness:([self.audioRecorder averagePowerForChannel:0])];
//	NSLog(@"Average input: %f Peak input: %f", [self.audioRecorder averagePowerForChannel:0], [self.audioRecorder peakPowerForChannel:0]);
//    if ([self.audioRecorder averagePowerForChannel:0] > -45) {
    // THIS IS THE TEST VALUE !!!! CHANGE TO -45 FOR LAUNCH
    if ([self.audioRecorder averagePowerForChannel:0] > 0) {
        [self.volumeCheckerView stopAndResetTimer];
        NSLog(@"Not quiet enough, timer stopped: %f", [self.audioRecorder averagePowerForChannel:0]);
        if(self.acceptTimer){
            [self.acceptTimer invalidate];
            self.acceptTimer = nil;
        }
    }else{
        NSLog(@"Quite quiet! Timer running: %f", [self.audioRecorder averagePowerForChannel:0]);
        if(!self.acceptTimer){
            [self.volumeCheckerView startTimer];
            // CHANGE VALUE FOR DEV/PROD HERE ! //
            self.acceptTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(acceptSpot:) userInfo: nil repeats:NO];
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
    [self.volumeCheckerView stopAndResetTimer];
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
    
    NSDictionary *params = @{@"title":  [NSString stringWithFormat:@"%@", addQuietSpotViewController.addQuietSpotView.txtTitle.text],
     @"subtitle":  [NSString stringWithFormat:@"%@", addQuietSpotViewController.addQuietSpotView.txtSubtitle.text],
     @"lon" : [NSString stringWithFormat:@"%@", addQuietSpotViewController.userlongitude],
     @"lat" : [NSString stringWithFormat:@"%@", addQuietSpotViewController.userlatitude]};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager POST:@"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/api/spots" parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         [addQuietSpotViewController dismissViewControllerAnimated:NO completion:^{
             NSLog(@"addQuietSpotVC dismissed");
             [self.delegate spotSavedShowMap];
             // TODO viewcontroller met succes -> show map?
         }];
         
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
         NSLog(@"RESPONSE STRING %@", operation.responseString);
     }];

}

- (UIBarButtonItem *) getBackButton
{
    NSLog(@"[MapVC] Get back button");
    self.btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    self.backarrow = [UIImage imageNamed:@"backarrow"];
    [self.btnBack setFrame:CGRectMake(20,20,self.backarrow.size.width,self.backarrow.size.height)];
    [self.btnBack setImage:self.backarrow forState:UIControlStateNormal];
    [self.btnBack addTarget:self action:@selector(backButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.btnBack];
    return backBarButton;
}

- (void)backButtonTapped
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIBarButtonItem *) getMenuButton
{
    self.btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    self.menubutton = [UIImage imageNamed:@"menubutton"];
    [self.btnMenu setFrame:CGRectMake(self.view.frame.size.width - 20,20,self.menubutton.size.width,self.menubutton.size.height)];
    [self.btnMenu setImage:self.menubutton forState:UIControlStateNormal];
    [self.btnMenu addTarget:self action:@selector(menuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.btnMenu];
    return menuBarButton;
}

- (void)menuButtonTapped
{
    NSLog(@"[MapVC] Menu button was tapped");
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
