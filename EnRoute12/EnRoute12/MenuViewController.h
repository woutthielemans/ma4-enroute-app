//
//  MenuViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"
#import "MenuDelegate.h"

@interface MenuViewController : UIViewController

@property (strong, nonatomic) MenuView *menuView;
@property (weak, nonatomic) id<MenuDelegate> delegate;
@property (strong, nonatomic) UIImage *screenshot;
@property (strong, nonatomic) NSString *page;

- (id)initWithScreenshot:(UIImage *)screenshot AndCurrentPage:(NSString *)page;

@end
