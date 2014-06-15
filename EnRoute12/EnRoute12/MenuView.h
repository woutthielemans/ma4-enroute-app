//
//  MenuView.h
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+ImageEffects.h"

@interface MenuView : UIView

@property (strong, nonatomic) UILabel *testLabel;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImage *effectimage;
@property (strong, nonatomic) UIImage *screenshot;
@property (strong, nonatomic) UIButton *btnQuit;
@property (strong, nonatomic) UIImage *logo;
@property (strong, nonatomic) UIButton *btnMenu;
@property (strong, nonatomic) UIButton *btnMap;
@property (strong, nonatomic) UIButton *btnNotifications;
@property (strong, nonatomic) NSString *page;

- (id)initWithFrame:(CGRect)frame Screenshot:(UIImage *)screenshot AndCurrentPage:(NSString *)page;

@end
