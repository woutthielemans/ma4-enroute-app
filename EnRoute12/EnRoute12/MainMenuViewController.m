//
//  MainMenuViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 08/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "MainMenuViewController.h"
#import "AssignmentViewController.h"
#import "AssignmentsTableViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        [self enumerateFonts];
    }
    return self;
}

- (void)userLoggedInWithType:(NSString *)type AndGroup:(int)group
{
    self.type = type;
    self.group = group;
    self.user = [UserFactory createUserWithUserType:type AndGroupId:group];
}

- (void)enumerateFonts{
    
    NSLog(@"-- Start enumerating fonts --");
    for (NSString *fontFamilyStrings in [UIFont familyNames]) {
        NSLog(@"-- Font Family: %@", fontFamilyStrings);
        for (NSString *fontStrings in [UIFont fontNamesForFamilyName:fontFamilyStrings]) {
            NSLog(@"-- Font: %@", fontStrings);
        }
    }
    NSLog(@"-- End enumerating fonts --");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mainMenuView startanimtimers];
    NSString *path = @"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/api/creativeassignments";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *loadedData = (NSArray *)responseObject;
        self.cassignments = [NSMutableArray array];
        
        for (NSDictionary *dict in loadedData) {
            int identifier = [[dict objectForKey:@"id"] intValue];
            int type = [[dict objectForKey:@"type"] intValue];
            int categoryid = [[dict objectForKey:@"category_id"] intValue];
            Assignment *cassignment = [AssignmentFactory createAssignmentWithIdentifier:identifier Type:type CategoryId:categoryid Title:[dict objectForKey:@"title"] IllustrationPath:[dict objectForKey:@"illustration"] AndText:[dict objectForKey:@"text"]];
            [self.cassignments addObject: cassignment];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error loading JSON");
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"error accessing api for assignments" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alerView show];
    }];
    [operation start];
    
    // Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    NotificationsViewController *notificationVC = [[NotificationsViewController alloc] init];
    [self.mainMenuView.btnStil addTarget:self action:@selector(stilleStadTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainMenuView.btnVriend addTarget:self action:@selector(vriendStadTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainMenuView.btnGroen addTarget:self action:@selector(groeneStadTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainMenuView.btnKaart addTarget:self action:@selector(kaartTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainMenuView.btnOpdracht addTarget:self action:@selector(extraOpdrachtenTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewDidAppear:(BOOL)animated{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isUserLoggedIn"] == NO) {
        self.loginVC = [[LoginViewController alloc] initWithBounds:[UIScreen mainScreen].bounds];
        self.loginVC.delegate = self;
        [self presentViewController:self.loginVC animated:NO completion:^{}];
    }
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.mainMenuView = [[MainMenuView alloc] initWithFrame:bounds];
    self.view = self.mainMenuView;
}

- (void)stilleStadTapped:(id)sender
{
    [self loadStilleStad];
}

- (void)vriendStadTapped:(id)sender
{
    [self loadVriendelijkeStad];
}

- (void)groeneStadTapped:(id)sender
{
    [self loadGroeneStad];
}

- (void)kaartTapped:(id)sender
{
    [self loadKaart];
}

- (void)extraOpdrachtenTapped:(id)sender
{
    [self loadOpdrachten];
}

- (void)loadStilleStad
{
    int curas = 0;
    Assignment *stilAssignment = self.cassignments[curas];
    self.assignmentVC = [[AssignmentViewController alloc] initWithAssignment:stilAssignment AndUser:self.user];
    self.assignmentVC.delegate = self;
    [self.navigationController pushViewController:self.assignmentVC animated:YES];
}

- (void)loadVriendelijkeStad
{
    int curas = 2;
    Assignment *vriendAssignment = self.cassignments[curas];
    self.assignmentVC = [[AssignmentViewController alloc] initWithAssignment:vriendAssignment AndUser:self.user];
    self.assignmentVC.delegate = self;
    [self.navigationController pushViewController:self.assignmentVC animated:YES];
}

- (void)loadGroeneStad
{
    int curas = 3;
    Assignment *groenAssignment = self.cassignments[curas];
    self.assignmentVC = [[AssignmentViewController alloc] initWithAssignment:groenAssignment AndUser:self.user];
    self.assignmentVC.delegate = self;
    [self.navigationController pushViewController:self.assignmentVC animated:YES];
}

- (void)loadKaart
{
    self.mapVC = [[MapViewController alloc] initWithUser:self.user];
    self.mapVC.delegate = self;
    [self.navigationController pushViewController:self.mapVC animated:YES];
}

- (void)loadOpdrachten
{
    self.assignmentTVC = [[AssignmentsTableViewController alloc] initWithUser:self.user];
    self.assignmentTVC.delegate = self;
    [self.navigationController pushViewController:self.assignmentTVC animated:YES];
}

- (void)loadMeldingen
{
    NSLog(@"[MenuVC] Load meldingen");
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
