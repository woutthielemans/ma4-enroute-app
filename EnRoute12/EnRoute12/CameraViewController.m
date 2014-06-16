//
//  CameraViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 16/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[self navigationController] setNavigationBarHidden:YES animated:NO];
        self.curcameraisfront = YES;
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
    // Do any additional setup after loading the view.
    [self showCamera];
    [self.cameraView.retakeButton addTarget:self action:@selector(retakeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.cameraView.shareButton addTarget:self action:@selector(shareButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.cameraView.useButton addTarget:self action:@selector(useButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)retakeButtonTapped:(id)sender
{
    NSLog(@"[QuoteVC] Retake photo tapped");
    NSMutableArray *controllers = [self.navigationController.viewControllers mutableCopy];
    [controllers removeLastObject];
    self.navigationController.viewControllers = controllers;
}

- (void)shareButtonTapped:(id)sender
{
    NSLog(@"[QuoteVC] Share this on facebook");
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        NSLog(@"Facebook available");
        
        SLComposeViewController *composeVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [composeVC addImage:self.cameraView.imageView.image];
        [composeVC addURL:[NSURL URLWithString:@"http://student.howest.be/mathias.lambrecht/20132014/MAIV/ENROUTE/"]];
        [self presentViewController:composeVC animated:YES completion:^{}];
    }else{
        NSLog(@"Facebook unavailable");
    }
}

- (void)useButtonTapped:(id)sender
{
    [self uploadPhoto];
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.cameraView = [[CameraView alloc] initWithFrame:bounds];
    self.view = self.cameraView;
}

- (void)showCamera
{
    self.picker = [[UIImagePickerController alloc]init];
    self.curcameraisfront = YES;
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        NSLog(@"[OverviewVC] Camera device available");
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        self.picker.mediaTypes = availableMediaTypes;
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        CGRect bounds = [UIScreen mainScreen].bounds;
        self.asCameraOverlay = [[AssignmentCameraOverlayView alloc] initWithFrame:bounds];
        self.picker.cameraOverlayView = self.asCameraOverlay;
        self.picker.showsCameraControls = NO;
        self.picker.allowsEditing = YES;
        if (self.curcameraisfront == YES) {
            self.picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        }else{
           self.picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        }
        CGAffineTransform translate = CGAffineTransformMakeTranslation(0, 71);
        self.picker.cameraViewTransform = translate;
        CGAffineTransform scale = CGAffineTransformScale(translate, 1.333333, 1.333333);
        self.picker.cameraViewTransform = scale;
        
        [self.asCameraOverlay.cancelButton addTarget:self action:@selector(cancelButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.asCameraOverlay.takePhotoButton addTarget:self action:@selector(takePhotoButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.asCameraOverlay.switchCameraButton addTarget:self action:@selector(switchCameraButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        
    }else{
        NSLog(@"[OverviewVC] No camera device available");
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:self.picker animated:YES completion:^{}];
    
    self.picker.delegate = self;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *picture = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.cameraView.imageView.image = picture;
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    [picker dismissViewControllerAnimated:NO completion:^{
        [self.cameraView showContent];
    }];
}

- (void)deletePhoto:(id)sender
{
    self.cameraView.imageView.image = nil;
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
    
    UIImage *selectedImage = self.cameraView.imageView.image;
    NSData *imageData = UIImageJPEGRepresentation(selectedImage, .4); // image size ca. 50 KB
    [fileManager POST:DataURLString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:imageData name:@"upfile" fileName:fileName mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success %@", responseObject);
        NSLog(@"Image = %@", selectedImage);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Failure %@, %@", error, operation.responseString);
    }];
    
    [self dismissAll];
}

- (void)dismissAll
{
    
    [UIView animateWithDuration:0.6f animations:^{
        
        //show message
        self.cameraView.succes.alpha = 1.f;
        
    }completion:^(BOOL finished){
        
        NSMutableArray *controllers = [self.navigationController.viewControllers mutableCopy];
        [controllers removeObjectsInRange:NSMakeRange(1, controllers.count-1)];
        self.navigationController.viewControllers = controllers;
        
    }];
}

- (void)cancelButtonTapped:(id)sender{
    NSLog(@"[CameraVC] Cancel button tapped");
    [self.picker dismissViewControllerAnimated:NO completion:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)takePhotoButtonTapped:(id)sender{
    [self.picker takePicture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchCameraButtonTapped:(id)sender
{
    if (self.curcameraisfront == YES) {
        self.picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        self.curcameraisfront = NO;
    }else{
        self.picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        self.curcameraisfront = YES;
    }
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
