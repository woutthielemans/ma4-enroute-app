//
//  AssignmentViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "AssignmentViewController.h"

@interface AssignmentViewController ()

@end

@implementation AssignmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = [NSString stringWithFormat:@"%@",self.assignment.title];
        self.menuIsOut = NO;
    }
    return self;
}

- (id)initWithAssignment:(Assignment *)assignment AndUser:(User *)user
{
    self.assignment = assignment;
    self.user = user;
    return [self initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationItem.leftBarButtonItem = [self getBackButton];
    self.navigationItem.rightBarButtonItem = [self getMenuButton];
    
    if (self.asView.assignment.type == 1) {
        self.navigationController.navigationBar.frame = CGRectMake(0, -100, self.asView.frame.size.width, self.navigationController.navigationBar.frame.size.height);
        [UIView animateWithDuration:0.7f animations:^{
            CGRect navframe = self.navigationController.navigationBar.frame;
            navframe.origin.y += 120;
            self.navigationController.navigationBar.frame = navframe;
        } completion:^(BOOL finished){}];
    }
    
    [self.asView.gphotobutton addTarget:self action:@selector(showCamera:) forControlEvents:UIControlEventTouchUpInside];
    [self.asView.gcheckbutton addTarget:self action:@selector(checkTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.asView.glistenbutton addTarget:self action:@selector(listenTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.asView.volumebutton addTarget:self action:@selector(volumeTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
//    [self.asView animateIllustration];
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
    if(self.asView.assignment.categoryid == 1 && self.asView.assignment.type == 2){
        [UIView animateWithDuration:0.4f animations:^{
            CGRect frame = self.asView.gphotobutton.frame;
            frame.origin.y += 80;
            self.self.asView.gphotobutton.frame = frame;
            CGRect illframe = self.asView.illImageView.frame;
            illframe.size.width -= 100.0f;
            illframe.size.height -= 100.0f;
            illframe.origin.x += 50;
            illframe.origin.y += 50;
            self.asView.illImageView.frame = illframe;
            self.asView.illImageView.alpha = 0.f;
        } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
    }else if(self.asView.assignment.categoryid == 2 && self.asView.assignment.type == 2){
        [UIView animateWithDuration:0.4f animations:^{
            CGRect frame = self.asView.glistenbutton.frame;
            frame.origin.y += 80;
            self.self.asView.glistenbutton.frame = frame;
            CGRect illframe = self.asView.illImageView.frame;
            illframe.size.width -= 100.0f;
            illframe.size.height -= 100.0f;
            illframe.origin.x += 50;
            illframe.origin.y += 50;
            self.asView.illImageView.frame = illframe;
            self.asView.illImageView.alpha = 0.f;
        } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
    }else if(self.asView.assignment.categoryid == 3 && self.asView.assignment.type == 2){
        [UIView animateWithDuration:0.4f animations:^{
            CGRect frame = self.asView.gcheckbutton.frame;
            frame.origin.y += 80;
            self.self.asView.gcheckbutton.frame = frame;
            CGRect illframe = self.asView.illImageView.frame;
            illframe.size.width -= 100.0f;
            illframe.size.height -= 100.0f;
            illframe.origin.x += 50;
            illframe.origin.y += 50;
            self.asView.illImageView.frame = illframe;
            self.asView.illImageView.alpha = 0.f;
        } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
    }else if(self.asView.assignment.type == 1){
        if (self.asView.assignment.identifier == 1) {
            [UIView animateWithDuration:0.4f animations:^{
                CGRect frame = self.asView.volumebutton.frame;
                frame.origin.y += 80;
                self.self.asView.volumebutton.frame = frame;
                CGRect illframe = self.asView.illImageView.frame;
                illframe.size.width -= 100.0f;
                illframe.size.height -= 100.0f;
                illframe.origin.x += 50;
                illframe.origin.y += 50;
                self.asView.illImageView.frame = illframe;
                self.asView.illImageView.alpha = 0.f;
                CGRect navframe = self.navigationController.navigationBar.frame;
                navframe.origin.y -= 100;
                self.navigationController.navigationBar.frame = navframe;
            } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
        }else if (self.asView.assignment.identifier == 3) {
            [UIView animateWithDuration:0.4f animations:^{
                CGRect frame = self.asView.quotebutton.frame;
                frame.origin.y += 80;
                self.self.asView.quotebutton.frame = frame;
                CGRect illframe = self.asView.illImageView.frame;
                illframe.size.width -= 100.0f;
                illframe.size.height -= 100.0f;
                illframe.origin.x += 50;
                illframe.origin.y += 50;
                self.asView.illImageView.frame = illframe;
                self.asView.illImageView.alpha = 0.f;
                CGRect navframe = self.navigationController.navigationBar.frame;
                navframe.origin.y -= 100;
                self.navigationController.navigationBar.frame = navframe;
            } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
        }else if (self.asView.assignment.identifier == 4) {
            [UIView animateWithDuration:0.4f animations:^{
                CGRect frame = self.asView.greenbutton.frame;
                frame.origin.y += 80;
                self.self.asView.greenbutton.frame = frame;
                CGRect illframe = self.asView.illImageView.frame;
                illframe.size.width -= 100.0f;
                illframe.size.height -= 100.0f;
                illframe.origin.x += 50;
                illframe.origin.y += 50;
                self.asView.illImageView.frame = illframe;
                self.asView.illImageView.alpha = 0.f;
                CGRect navframe = self.navigationController.navigationBar.frame;
                navframe.origin.y -= 100;
                self.navigationController.navigationBar.frame = navframe;
            } completion:^(BOOL finished){[self.navigationController popViewControllerAnimated:YES];}];
        }
    }
}

- (UIBarButtonItem *)getMenuButton
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
        
        UIGraphicsBeginImageContext(self.asView.bounds.size);
        [self.asView.window.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *screenshot=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.menuVC = [[MenuViewController alloc] initWithScreenshot:screenshot AndCurrentPage:@"Assignment"];
        [self addChildViewController:self.menuVC];
        self.menuVC.delegate = self;
        self.menuVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
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

- (void)showCamera:(id)camera{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"Camera available");
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = availableMediaTypes;
    }else{
        NSLog(@"Camera not available");
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    [self presentViewController:imagePicker animated:YES completion:^{}];
    imagePicker.delegate = self;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //    self.view.scrollView.hidden = YES;
    UIImage *picture = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.asView.imageView.image = picture;
    [picker dismissViewControllerAnimated:YES completion:^{
        [self uploadPhoto];
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(deletePhoto:) userInfo:nil repeats:NO];
    }];
}

- (void)deletePhoto:(id)sender
{
    self.asView.imageView.image = nil;
}

-(void)uploadPhoto{
    NSLog(@"Uploading photo...");
    NSString *fileName = [NSString stringWithFormat:@"%i%ld%c%c.jpeg", self.user.groupid, (long)[[NSDate date] timeIntervalSince1970], arc4random_uniform(26) + 'a', arc4random_uniform(26) + 'a'];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    NSDictionary *params = @{@"group_id": [NSString stringWithFormat:@"%i", self.user.groupid],
                             @"path": [NSString stringWithFormat:@"%@", fileName]};
    
    [manager POST:@"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/api/photos" parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
     }
          failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error: %@", error);
     }];
    
    AFHTTPRequestOperationManager *fileManager = [AFHTTPRequestOperationManager manager];
    fileManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    NSString *DataURLString = @"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/uploadphoto.php";
    
    UIImage *selectedImage = self.asView.imageView.image;
    NSData *imageData = UIImageJPEGRepresentation(selectedImage, .4); // image size ca. 50 KB
    [fileManager POST:DataURLString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imageData name:@"upfile" fileName:fileName mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success %@", responseObject);
        NSLog(@"Image = %@", selectedImage);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure %@, %@", error, operation.responseString);
    }];
}

- (void)checkTapped:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)listenTapped:(id)sender
{
    NSLog(@"[AssignmentVC] Standard assignment listen tapped - type should not exist for standard a's, returning to TVC");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)volumeTapped:(id)sender
{
    self.volumeCheckerVC  =[[VolumeCheckerViewController alloc] initWithUser:self.user];
    self.volumeCheckerVC.delegate = self;
    [self.navigationController pushViewController:self.volumeCheckerVC animated:YES];
}

- (void)spotSavedShowMap
{
    NSLog(@"[AssignemtVC] Spot saved, show map");
    [self.navigationController popViewControllerAnimated:NO];
    MapViewController *mapVC = [[MapViewController alloc] init];
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.asView = [[AssignmentView alloc] initWithFrame:bounds andAssignment:self.assignment];
    self.view = self.asView;
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
