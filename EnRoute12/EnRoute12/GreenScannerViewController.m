//
//  GreenScannerViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "GreenScannerViewController.h"

@interface GreenScannerViewController ()

@end

@implementation GreenScannerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.greenScannerView = [[GreenScannerView alloc] initWithFrame:bounds];
    self.view = self.greenScannerView;
}

- (void)dismissAll
{
    
    [UIView animateWithDuration:0.6f animations:^{
        
        //show message
        self.greenScannerView.succes.alpha = 1.f;
        
    }completion:^(BOOL finished){
        
        NSMutableArray *controllers = [self.navigationController.viewControllers mutableCopy];
        [controllers removeObjectsInRange:NSMakeRange(1, controllers.count-1)];
        self.navigationController.viewControllers = controllers;
        
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"[VolumeCheckerV] Touches began");
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.greenScannerView];
    self.xPos = p.x;
    self.yPos = p.y;
    
    if (self.xPos < self.greenScannerView.frame.size.width/2 && self.yPos < (self.greenScannerView.frame.size.height/4)*1) {
        NSLog(@"[GreenScannerView] Tapped zone 1");
        [self scanZone1];
    }else if (self.xPos > self.greenScannerView.frame.size.width/2 && self.yPos < (self.greenScannerView.frame.size.height/4)*1) {
        NSLog(@"[GreenScannerView] Tapped zone 2");
        [self scanZone2];
    }else if (self.xPos < self.greenScannerView.frame.size.width/2 && self.yPos > (self.greenScannerView.frame.size.height/4)*1 && self.yPos < (self.greenScannerView.frame.size.height/4)*2) {
        NSLog(@"[GreenScannerView] Tapped zone 3");
        [self scanZone3];
    }else if (self.xPos > self.greenScannerView.frame.size.width/2 && self.yPos > (self.greenScannerView.frame.size.height/4)*1 && self.yPos < (self.greenScannerView.frame.size.height/4)*2) {
        NSLog(@"[GreenScannerView] Tapped zone 4");
        [self scanZone4];
    }else if (self.xPos < self.greenScannerView.frame.size.width/2 && self.yPos > (self.greenScannerView.frame.size.height/4)*2 && self.yPos < (self.greenScannerView.frame.size.height/4)*3) {
        NSLog(@"[GreenScannerView] Tapped zone 5");
        [self scanZone5];
    }else if (self.xPos > self.greenScannerView.frame.size.width/2 && self.yPos > (self.greenScannerView.frame.size.height/4)*2 && self.yPos < (self.greenScannerView.frame.size.height/4)*3) {
        NSLog(@"[GreenScannerView] Tapped zone 6");
        [self scanZone6];
    }else if (self.xPos < self.greenScannerView.frame.size.width/2 && self.yPos > (self.greenScannerView.frame.size.height/4)*3) {
        NSLog(@"[GreenScannerView] Tapped zone 7");
        [self scanZone7];
    }else if (self.xPos > self.greenScannerView.frame.size.width/2 && self.yPos > (self.greenScannerView.frame.size.height/4)*3) {
        NSLog(@"[GreenScannerView] Tapped zone 8");
        [self scanZone8];
    }
}

- (void)scanZone1
{
    NSLog(@"[GreenScannerView] Scanning zone 1...");
}

- (void)scanZone2
{
    NSLog(@"[GreenScannerView] Scanning zone 2...");
}

- (void)scanZone3
{
    NSLog(@"[GreenScannerView] Scanning zone 3...");
}

- (void)scanZone4
{
    NSLog(@"[GreenScannerView] Scanning zone 4...");
}

- (void)scanZone5
{
    NSLog(@"[GreenScannerView] Scanning zone 5...");
}

- (void)scanZone6
{
    NSLog(@"[GreenScannerView] Scanning zone 6...");
}

- (void)scanZone7
{
    NSLog(@"[GreenScannerView] Scanning zone 7...");
}

- (void)scanZone8
{
    NSLog(@"[GreenScannerView] Scanning zone 8...");
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
