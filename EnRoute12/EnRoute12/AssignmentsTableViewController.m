//
//  AssignmentsTableViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 03/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "AssignmentsTableViewController.h"

@interface AssignmentsTableViewController ()

@end

@implementation AssignmentsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.title = @"Opdrachten";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationItem.leftBarButtonItem = [self getBackButton];
    self.navigationItem.rightBarButtonItem = [self getMenuButton];
    
    NSString *path = @"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/api/standardassignments";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *loadedData = (NSArray *)responseObject;
        self.assignments = [NSMutableArray array];
        
        for (NSDictionary *dict in loadedData) {
            int identifier = [[dict objectForKey:@"id"] intValue];
            int type = [[dict objectForKey:@"type"] intValue];
            int categoryid = [[dict objectForKey:@"category_id"] intValue];
            Assignment *sassignment = [AssignmentFactory createAssignmentWithIdentifier:identifier Type:type CategoryId:categoryid Title:[dict objectForKey:@"title"] IllustrationPath:[dict objectForKey:@"illustration"] AndText:[dict objectForKey:@"text"]];
            [self.assignments addObject: sassignment];
            [self.tableView reloadData];
        }
//        for (Assignment *a in self.assignments) {
//            NSLog(@"[AssignmentsTVC] Assignment #%i: %@",a.identifier,a.title);
//        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error loading JSON");
        UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"error accessing api for assignments" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alerView show];
    }];
    [operation start];
    
    [self.tableView registerClass:[AssignmentTableViewCell class] forCellReuseIdentifier:@"AssignmentCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIBarButtonItem *) getMenuButton
{
    self.btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    self.menubuttonmap = [UIImage imageNamed:@"menubuttonmap"];
    [self.btnMenu setFrame:CGRectMake(self.view.frame.size.width - 20,20,self.menubuttonmap.size.width,self.menubuttonmap.size.height)];
    [self.btnMenu setImage:self.menubuttonmap forState:UIControlStateNormal];
    [self.btnMenu addTarget:self action:@selector(menuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.btnMenu];
    return menuBarButton;
}

- (void)menuButtonTapped
{
    NSLog(@"[MapVC] Menu button was tapped");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.assignments.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AssignmentCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Assignment *acell = [self.assignments objectAtIndex:indexPath.row];
    NSLog(@"%@",acell);
    
    cell.textLabel.text = acell.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Assignment *assigment = [self.assignments objectAtIndex:indexPath.row];
    
    AssignmentViewController *assignmentVC = [[AssignmentViewController alloc] initWithAssignment:assigment];
    [self.navigationController pushViewController:assignmentVC animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
