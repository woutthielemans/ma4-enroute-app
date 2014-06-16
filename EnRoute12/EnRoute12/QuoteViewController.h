//
//  QuoteViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <Social/Social.h>
#import "QuoteView.h"
#import "User.h"
#import "Quote.h"
#import "QuoteCameraOverlayView.h"
#import "MenuViewController.h"

@interface QuoteViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSCoding>

@property (strong, nonatomic) QuoteView *quoteView;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) Quote *quote;
@property (strong, nonatomic) UIImagePickerController *picker;
@property (strong, nonatomic) QuoteCameraOverlayView *quoteoverlayview;
@property (strong, nonatomic) NSTimer *photoTimer;
@property (strong, nonatomic) UIButton *btnBack;
@property (strong, nonatomic) UIButton *btnMenu;
@property (strong, nonatomic) UIImage *backarrow;
@property (strong, nonatomic) UIImage *menubutton;

- (id)initWithUser:(User *)user AndQuote:(Quote *)quote;

@end
