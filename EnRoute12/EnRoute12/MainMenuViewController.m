//
//  MainMenuViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 08/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    [self.mainMenuView.btnKaart addTarget:self action:@selector(kaartTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.mainMenuView = [[MainMenuView alloc] initWithFrame:bounds];
    self.view = self.mainMenuView;
}

- (void)kaartTapped:(id)sender
{
    MapViewController *mapVC = [[MapViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:mapVC animated:YES];
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
