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
        self.menuIsOut = NO;
    }
    return self;
}

- (id)initWithUser:(User *)user
{
    self.user = user;
    return [self initWithStyle:UITableViewStylePlain];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.frame = CGRectMake(0, -100, self.tableView.frame.size.width, self.navigationController.navigationBar.frame.size.height);
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationItem.leftBarButtonItem = [self getBackButton];
    self.navigationItem.rightBarButtonItem = [self getMenuButton];
    
    [UIView animateWithDuration:0.7f animations:^{
        CGRect navframe = self.navigationController.navigationBar.frame;
        navframe.origin.y += 120;
        self.navigationController.navigationBar.frame = navframe;
    } completion:^(BOOL finished){}];
    
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
    self.backarrow = [UIImage imageNamed:@"backarrow"];
    [self.btnBack setFrame:CGRectMake(20,20,self.backarrow.size.width,self.backarrow.size.height)];
    [self.btnBack setImage:self.backarrow forState:UIControlStateNormal];
    [self.btnBack addTarget:self action:@selector(backButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:self.btnBack];
    return backBarButton;
}

- (void)backButtonTapped
{
    [UIView animateWithDuration:0.4f animations:^{
        CGRect navframe = self.navigationController.navigationBar.frame;
        navframe.origin.y -= 100;
        self.navigationController.navigationBar.frame = navframe;
    } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
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
    NSLog(@"[AssignmentVC] Menu is out: %hhd",self.menuIsOut);
    if (self.menuIsOut == NO) {
        
        [UIView animateWithDuration:0.4f animations:^{
            CGRect navframe = self.navigationController.navigationBar.frame;
            navframe.origin.y -= 100;
            self.navigationController.navigationBar.frame = navframe;
        } completion:^(BOOL finished){}];
        
        UIGraphicsBeginImageContext(self.tableView.bounds.size);
        [self.tableView.window.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *screenshot=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.menuVC = [[MenuViewController alloc] initWithScreenshot:screenshot AndCurrentPage:@"ExtraAssignments"];
        [self addChildViewController:self.menuVC];
        self.menuVC.delegate = self;
        self.menuVC.view.frame = CGRectMake(0, -65, self.view.frame.size.width, self.view.frame.size.height);
        [self.view addSubview:self.menuVC.view];
        [self.menuVC didMoveToParentViewController:self];
        self.menuIsOut = YES;
    }
}

- (void)menuDidQuit
{
    [UIView animateWithDuration:0.7f animations:^{
        CGRect navframe = self.navigationController.navigationBar.frame;
        navframe.origin.y += 100;
        self.navigationController.navigationBar.frame = navframe;
    } completion:^(BOOL finished){}];
    self.menuIsOut = NO;
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
    
    AssignmentViewController *assignmentVC = [[AssignmentViewController alloc] initWithAssignment:assigment AndUser:self.user];
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
