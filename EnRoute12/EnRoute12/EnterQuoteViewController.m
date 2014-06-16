//
//  EnterQuoteViewController.m
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "EnterQuoteViewController.h"

@interface EnterQuoteViewController ()

@end

@implementation EnterQuoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Voer een quote in";
    }
    return self;
}

- (id)initWithUser:(User *)user
{
    self.user = user;
    return [super initWithNibName:nil bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.enterquoteview.txtQuote.text = @"";
    [self.enterquoteview.btnSave addTarget:self action:@selector(saveQuoteAndShowCamera:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)saveQuoteAndShowCamera:(id)sender
{
    Quote *quote = [QuoteFactory createQuoteWithText:self.enterquoteview.txtQuote.text];
    QuoteViewController *quoteVC = [[QuoteViewController alloc] initWithUser:self.user AndQuote:quote];
    [self.navigationController pushViewController:quoteVC animated:NO];
}

- (void)loadView
{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.enterquoteview = [[EnterQuoteView alloc] initWithFrame:bounds];
    self.view = self.enterquoteview;
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
