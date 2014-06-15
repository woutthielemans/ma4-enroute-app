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
        self.user = [UserFactory createUserWithUserType:@"STUDENT" AndGroupId:7];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    int curas = 0;
    Assignment *stilAssignment = self.cassignments[curas];
    AssignmentViewController *assignmentVC = [[AssignmentViewController alloc] initWithAssignment:stilAssignment AndUser:self.user];
    [UIView animateWithDuration:0.1f animations:^{
        CGRect btnframe = self.mainMenuView.btnStil.frame;
        btnframe.size.width -= 10.0f;
        btnframe.size.height -= 10.0f;
        btnframe.origin.x += 5;
        btnframe.origin.y += 5;
        self.mainMenuView.btnStil.frame = btnframe;
    } completion:^(BOOL finished){
        [self.navigationController pushViewController:assignmentVC animated:YES];
        CGRect btnframe = self.mainMenuView.btnStil.frame;
        btnframe.size.width += 10.0f;
        btnframe.size.height += 10.0f;
        btnframe.origin.x -= 5;
        btnframe.origin.y -= 5;
        self.mainMenuView.btnStil.frame = btnframe;
    }];
}

- (void)vriendStadTapped:(id)sender
{
    int curas = 2;
    Assignment *vriendAssignment = self.cassignments[curas];
    AssignmentViewController *assignmentVC = [[AssignmentViewController alloc] initWithAssignment:vriendAssignment AndUser:self.user];
    [UIView animateWithDuration:0.1f animations:^{
        CGRect btnframe = self.mainMenuView.btnVriend.frame;
        btnframe.size.width -= 10.0f;
        btnframe.size.height -= 10.0f;
        btnframe.origin.x += 5;
        btnframe.origin.y += 5;
        self.mainMenuView.btnVriend.frame = btnframe;
    } completion:^(BOOL finished){
        [self.navigationController pushViewController:assignmentVC animated:YES];
        CGRect btnframe = self.mainMenuView.btnVriend.frame;
        btnframe.size.width += 10.0f;
        btnframe.size.height += 10.0f;
        btnframe.origin.x -= 5;
        btnframe.origin.y -= 5;
        self.mainMenuView.btnVriend.frame = btnframe;
    }];
}

- (void)groeneStadTapped:(id)sender
{
    int curas = 3;
    Assignment *groenAssignment = self.cassignments[curas];
    AssignmentViewController *assignmentVC = [[AssignmentViewController alloc] initWithAssignment:groenAssignment AndUser:self.user];
    [UIView animateWithDuration:0.1f animations:^{
        CGRect btnframe = self.mainMenuView.btnGroen.frame;
        btnframe.size.width -= 10.0f;
        btnframe.size.height -= 10.0f;
        btnframe.origin.x += 5;
        btnframe.origin.y += 5;
        self.mainMenuView.btnGroen.frame = btnframe;
    } completion:^(BOOL finished){
        [self.navigationController pushViewController:assignmentVC animated:YES];
        CGRect btnframe = self.mainMenuView.btnGroen.frame;
        btnframe.size.width += 10.0f;
        btnframe.size.height += 10.0f;
        btnframe.origin.x -= 5;
        btnframe.origin.y -= 5;
        self.mainMenuView.btnGroen.frame = btnframe;
    }];
}

- (void)kaartTapped:(id)sender
{
    MapViewController *mapVC = [[MapViewController alloc] initWithUser:self.user];
    [UIView animateWithDuration:0.1f animations:^{
        CGRect btnframe = self.mainMenuView.btnKaart.frame;
        btnframe.size.width -= 10.0f;
        btnframe.size.height -= 10.0f;
        btnframe.origin.x += 5;
        btnframe.origin.y += 5;
        self.mainMenuView.btnKaart.frame = btnframe;
    } completion:^(BOOL finished){
        [self.navigationController pushViewController:mapVC animated:YES];
        CGRect btnframe = self.mainMenuView.btnKaart.frame;
        btnframe.size.width += 10.0f;
        btnframe.size.height += 10.0f;
        btnframe.origin.x -= 5;
        btnframe.origin.y -= 5;
        self.mainMenuView.btnKaart.frame = btnframe;
    }];
}

- (void)extraOpdrachtenTapped:(id)sender
{
    AssignmentsTableViewController *assignmentTVC = [[AssignmentsTableViewController alloc] initWithUser:self.user];
    [UIView animateWithDuration:0.1f animations:^{
        CGRect btnframe = self.mainMenuView.btnOpdracht.frame;
        btnframe.size.width -= 10.0f;
        btnframe.size.height -= 10.0f;
        btnframe.origin.x += 5;
        btnframe.origin.y += 5;
        self.mainMenuView.btnOpdracht.frame = btnframe;
    } completion:^(BOOL finished){
        [self.navigationController pushViewController:assignmentTVC animated:YES];
        CGRect btnframe = self.mainMenuView.btnOpdracht.frame;
        btnframe.size.width += 10.0f;
        btnframe.size.height += 10.0f;
        btnframe.origin.x -= 5;
        btnframe.origin.y -= 5;
        self.mainMenuView.btnOpdracht.frame = btnframe;
    }];
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
