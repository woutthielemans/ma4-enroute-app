//
//  MenuViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 03/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Zentrijk";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    // Do any additional setup after loading the view.
    self.menuView.navBarHeight = self.navigationController.navigationBar.frame.size.height;
    [self.menuView.mi1_button addTarget:self action:@selector(menuItem1Tapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView.mi2_button addTarget:self action:@selector(menuItem2Tapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.menuView.mi3_button addTarget:self action:@selector(menuItem3Tapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)menuItem1Tapped:(id)sender
{
    NSLog(@"[MenuView] 'Ontdek Zentrijk' tapped!");
    MapViewController *mapVC = [[MapViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (void)menuItem2Tapped:(id)sender
{
    NSLog(@"[MenuView] 'Opdrachten' tapped!");
    AssignmentsTableViewController *assignmentsTVC = [[AssignmentsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:assignmentsTVC animated:YES];
}

- (void)menuItem3Tapped:(id)sender
{
    NSLog(@"[MenuView] 'Meldingen' tapped!");
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.menuView = [[MenuView alloc] initWithFrame:bounds];
    self.view = self.menuView;
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
