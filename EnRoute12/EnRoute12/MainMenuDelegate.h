//
//  MainMenuDelegate.h
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MainMenuDelegate <NSObject>

@optional
- (void)loadStilleStad;
- (void)loadGroeneStad;
- (void)loadKaart;
- (void)loadOpdrachten;
- (void)loadMeldingen;

@end
