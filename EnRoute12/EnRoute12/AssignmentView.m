//
//  AssignmentView.m
//  EnRoute12
//
//  Created by Wout Thielemans on 05/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "AssignmentView.h"

@implementation AssignmentView

- (id)initWithFrame:(CGRect)frame andAssignment:(Assignment *)assignment
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:171/255.0f green:219/255.0f blue:221/255.0f alpha:1];
        self.illustration = assignment.illustration;
        UIImageView *illImageView = [[UIImageView alloc] initWithImage:self.illustration];
        illImageView.frame = CGRectMake(self.frame.size.width/2 - self.illustration.size.width/2, 100, self.illustration.size.width, self.illustration.size.height);
//        illImageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:illImageView];
        
        self.text = assignment.text;
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 4.0;
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attributedString.length)];
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(15, 250, frame.size.width-30, self.frame.size.height)];
        textView.backgroundColor = [UIColor clearColor];
        textView.attributedText = attributedString;
        textView.editable = NO;
        [self addSubview:textView];
        
        if(assignment.categoryid == 1 && assignment.type == 2){
            NSLog(@"[AssignmentView] Assignment is of type: %i, and category: %i - photo",assignment.type, assignment.categoryid);
            UIImage *photobutton = [UIImage imageNamed:@"fotobutton"];
            self.gphotobutton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.gphotobutton.frame = CGRectMake(self.frame.size.width/2 - photobutton.size.width/2, self.frame.size.height - 150, photobutton.size.width, photobutton.size.height);
            [self.gphotobutton setBackgroundImage:photobutton forState:UIControlStateNormal];
            [self addSubview:self.gphotobutton];
        }else if(assignment.categoryid == 2 && assignment.type == 2){
            NSLog(@"[AssignmentView] Assignment is of type: %i, and category: %i - sound",assignment.type, assignment.categoryid);
            UIImage *listenbutton = [UIImage imageNamed:@"luisterbutton"];
            self.glistenbutton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.glistenbutton.frame = CGRectMake(self.frame.size.width/2 - listenbutton.size.width/2, self.frame.size.height - 150, listenbutton.size.width, listenbutton.size.height);
            [self.glistenbutton setBackgroundImage:listenbutton forState:UIControlStateNormal];
            [self addSubview:self.glistenbutton];
        }else if(assignment.categoryid == 3 && assignment.type == 2){
            NSLog(@"[AssignmentView] Assignment is of type: %i, and category: %i - check",assignment.type, assignment.categoryid);
            UIImage *checkbutton = [UIImage imageNamed:@"checkbutton"];
            self.gcheckbutton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.gcheckbutton.frame = CGRectMake(self.frame.size.width/2 - checkbutton.size.width/2, self.frame.size.height - 150, checkbutton.size.width, checkbutton.size.height);
            [self.gcheckbutton setBackgroundImage:checkbutton forState:UIControlStateNormal];
            [self addSubview:self.gcheckbutton];
        }else if(assignment.type == 1){
            NSLog(@"[AssignmentView] Custom action required");
            if (assignment.identifier == 1) {
                NSLog(@"[AssignmentView] Go to volume checker app");
                UIImage *listenbutton = [UIImage imageNamed:@"luisterbutton"];
                self.volumebutton = [UIButton buttonWithType:UIButtonTypeCustom];
                self.volumebutton.frame = CGRectMake(self.frame.size.width/2 - listenbutton.size.width/2, self.frame.size.height - 150, listenbutton.size.width, listenbutton.size.height);
                [self.volumebutton setBackgroundImage:listenbutton forState:UIControlStateNormal];
                [self addSubview:self.volumebutton];
            }else if (assignment.identifier == 3) {
                NSLog(@"[AssignmentView] Go to quote app");
                UIImage *photobutton = [UIImage imageNamed:@"fotobutton"];
                self.quotebutton = [UIButton buttonWithType:UIButtonTypeCustom];
                self.quotebutton.frame = CGRectMake(self.frame.size.width/2 - photobutton.size.width/2, self.frame.size.height - 150, photobutton.size.width, photobutton.size.height);
                [self.quotebutton setBackgroundImage:photobutton forState:UIControlStateNormal];
                [self addSubview:self.quotebutton];
            }else if (assignment.identifier == 4) {
                NSLog(@"[AssignmentView] Go to green app");
                UIImage *photobutton = [UIImage imageNamed:@"fotobutton"];
                self.greenbutton = [UIButton buttonWithType:UIButtonTypeCustom];
                self.greenbutton.frame = CGRectMake(self.frame.size.width/2 - photobutton.size.width/2, self.frame.size.height - 150, photobutton.size.width, photobutton.size.height);
                [self.greenbutton setBackgroundImage:photobutton forState:UIControlStateNormal];
                [self addSubview:self.greenbutton];
            }
        }
        
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
