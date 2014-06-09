//
//  NotificationsViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 09/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "NotificationsViewController.h"

@interface NotificationsViewController ()

@end

@implementation NotificationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSString *path = @"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/upload/api/notifications";
        NSURL *url = [NSURL URLWithString:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSArray *loadedData = (NSArray *)responseObject;
            self.notifications = [NSMutableDictionary dictionary];
            
            for (NSDictionary *dict in loadedData) {
                int identifier = [[dict objectForKey:@"id"] intValue];
                int groupid = [[dict objectForKey:@"group_id"] intValue];
                Notification *notification = [NotificationFactory createNotificationWithIdentifier:identifier Title:[dict objectForKey:@"title"] Subtitle:[dict objectForKey:@"subtitle"] GroupId:groupid Time:[dict objectForKey:@"time"] AndText:[dict objectForKey:@"text"]];
                [self.notifications setObject:notification forKey:[dict objectForKey:@"title"]];
                NSLog(@"[NotificationsVC] Notification added: %i - %@ at %@",notification.identifier,notification.title,notification.time);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error loading JSON");
            UIAlertView *alerView = [[UIAlertView alloc] initWithTitle:@"error accessing api for assignments" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alerView show];
        }];
        [operation start];
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
    self.notificationView = [[NotificationsView alloc] initWithFrame:bounds AndNotifications:self.notifications];
    self.view = self.notificationView;
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
