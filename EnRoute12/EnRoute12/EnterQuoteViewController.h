//
//  EnterQuoteViewController.h
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EnterQuoteView.h"
#import "User.h"
#import "Quote.h"
#import "QuoteFactory.h"
#import "QuoteViewController.h"

@interface EnterQuoteViewController : UIViewController

@property (strong, nonatomic) EnterQuoteView *enterquoteview;
@property (strong, nonatomic) User *user;

- (id)initWithUser:(User *)user;

@end
