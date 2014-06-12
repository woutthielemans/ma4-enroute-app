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
    }
    return self;
}

- (id)initWithAssignment:(Assignment *)assignment
{
    self.assignment = assignment;
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
    
    [self.asView.gphotobutton addTarget:self action:@selector(showCamera:) forControlEvents:UIControlEventTouchUpInside];
    [self.asView.gcheckbutton addTarget:self action:@selector(checkTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.asView.glistenbutton addTarget:self action:@selector(listenTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.asView.volumebutton addTarget:self action:@selector(volumeTapped:) forControlEvents:UIControlEventTouchUpInside];
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
    [self.navigationController popViewControllerAnimated:YES];
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
    NSLog(@"[MapVC] Menu button was tapped");
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
    UIImage *resizedImage = [self imageWithImage:self.asView.imageView.image scaledToSize:CGSizeMake(self.asView.imageView.image.size.width/2.5, self.asView.imageView.image.size.height/2.5)];
    NSData *imageData = UIImageJPEGRepresentation(resizedImage, 0.4);
    NSString *urlString = @"http://student.howest.be/wout.thielemans/20132014/MAIV/ENROUTE/uploadphoto.php";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"uploadedfile\"; filename=\"test.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[NSData dataWithData:imageData]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"Image Return String: %@", returnString);
}

- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
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
    self.volumeCheckerVC  =[[VolumeCheckerViewController alloc] initWithNibName:nil bundle:nil];
    self.volumeCheckerVC.delegate = self;
    [self presentViewController:self.volumeCheckerVC animated:YES completion:^{}];
}

- (void)spotSavedShowMap
{
    NSLog(@"[AssignemtVC] Spot saved, show map");
    [self.volumeCheckerVC dismissViewControllerAnimated:NO completion:^{
        MapViewController *mapVC = [[MapViewController alloc] init];
        [self.navigationController pushViewController:mapVC animated:YES];
    }];
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
