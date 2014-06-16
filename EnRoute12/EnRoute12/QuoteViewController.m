//
//  QuoteViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "QuoteViewController.h"

@interface QuoteViewController ()

@end

@implementation QuoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[self navigationController] setNavigationBarHidden:YES animated:NO];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                      forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
        self.navigationController.navigationBar.translucent = YES;
    }
    return self;
}

- (id)initWithUser:(User *)user AndQuote:(Quote *)quote
{
    self.user = user;
    self.quote = quote;
    return [self initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showCamera];
    [self.quoteView.retakeButton addTarget:self action:@selector(retakeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.quoteView.shareButton addTarget:self action:@selector(shareButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.quoteView.useButton addTarget:self action:@selector(useButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
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
}

- (void)useButtonTapped:(id)sender
{
    [self uploadPhoto];
}


- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.quoteView = [[QuoteView alloc] initWithFrame:bounds andQuote:self.quote];
    self.view = self.quoteView;
}

- (void)showCamera
{
    self.picker = [[UIImagePickerController alloc]init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        NSLog(@"[OverviewVC] Camera device available");
        NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        self.picker.mediaTypes = availableMediaTypes;
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        CGRect bounds = [UIScreen mainScreen].bounds;
        self.quoteoverlayview = [[QuoteCameraOverlayView alloc] initWithFrame:bounds AndQuote:self.quote];
        self.picker.cameraOverlayView = self.quoteoverlayview;
        self.picker.showsCameraControls = NO;
        self.picker.allowsEditing = NO;
        self.picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        CGAffineTransform translate = CGAffineTransformMakeTranslation(0, 0);
        self.picker.cameraViewTransform = translate;
        CGAffineTransform scale = CGAffineTransformScale(translate, 1.333333, 1.333333);
        self.picker.cameraViewTransform = scale;
        self.photoTimer = [NSTimer scheduledTimerWithTimeInterval:3 target: self selector:@selector(sayCheese:) userInfo:nil repeats:NO];
        
//        [self.quoteoverlayview.picture addTarget:self action:@selector(picture:) forControlEvents:UIControlEventTouchUpInside];
//        [self.quoteoverlayview.back addTarget:self action:@selector(prev:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        NSLog(@"[OverviewVC] No camera device available");
        self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:self.picker animated:YES completion:^{}];
    
    self.picker.delegate = self;
}

- (void)sayCheese:(NSTimer *)timer
{
    [self.picker takePicture];
    NSLog(@"[QuoteVC] Picker took picture");
//    self.quoteView.imageView.image = screenshot;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *picture = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.quoteView.imageView.image = picture;
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    [picker dismissViewControllerAnimated:NO completion:^{
        [self.quoteView showContent];
//        [self uploadPhoto];
//        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(deletePhoto:) userInfo:nil repeats:NO];
    }];
}

- (void)deletePhoto
{
    self.quoteView.imageView.image = nil;
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
    
    UIImage *selectedImage = self.quoteView.savethisphoto;
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
        self.quoteView.succes.alpha = 1.f;
        
    }completion:^(BOOL finished){
        
        NSMutableArray *controllers = [self.navigationController.viewControllers mutableCopy];
        [controllers removeObjectsInRange:NSMakeRange(1, controllers.count-1)];
        self.navigationController.viewControllers = controllers;
        
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
