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
        self.assignment = assignment;
        self.backgroundColor = [UIColor colorWithRed:171/255.0f green:219/255.0f blue:221/255.0f alpha:1];
        self.illustration = assignment.illustration;
        self.illImageView = [[UIImageView alloc] initWithImage:self.illustration];
        self.illImageView.frame = CGRectMake(0, 0, self.frame.size.width*0.2, self.frame.size.width*0.2);
        self.illImageView.alpha = 0;
        self.illImageView.center = CGPointMake(self.frame.size.width/2, 150);
        [self addSubview:self.illImageView];
        
        [UIView animateWithDuration:0.6f animations:^{
            CGRect frame = self.illImageView.frame;
            frame.size.width += 100.0f;
            frame.size.height += 100.0f;
            frame.origin.x -= 50;
            frame.origin.y -= 50;
            self.illImageView.frame = frame;
            self.illImageView.alpha = 1.0f;
        }
        completion:^(BOOL finished){}];
        
        self.text = assignment.text;
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 4.0;
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attributedString.length)];
        
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(15, 240, frame.size.width-30, self.frame.size.height)];
        textView.backgroundColor = [UIColor clearColor];
        textView.attributedText = attributedString;
        textView.editable = NO;
        [self addSubview:textView];
        
        if(self.assignment.categoryid == 1 && self.assignment.type == 2){
            NSLog(@"[AssignmentView] Assignment is of type: %i, and category: %i - photo",self.assignment.type, self.assignment.categoryid);
            UIImage *photobutton = [UIImage imageNamed:@"fotobutton"];
            self.gphotobutton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.gphotobutton.frame = CGRectMake(self.frame.size.width/2 - photobutton.size.width/2, self.frame.size.height, photobutton.size.width, photobutton.size.height);
            [self.gphotobutton setBackgroundImage:photobutton forState:UIControlStateNormal];
            [self addSubview:self.gphotobutton];
            [UIView animateWithDuration:0.7f animations:^{
                CGRect frame = self.gphotobutton.frame;
                frame.origin.y -= 80;
                self.gphotobutton.frame = frame;
            } completion:^(BOOL finished){}];
        }else if(self.assignment.categoryid == 2 && self.assignment.type == 2){
            NSLog(@"[AssignmentView] Assignment is of type: %i, and category: %i - sound",self.assignment.type, self.assignment.categoryid);
            UIImage *listenbutton = [UIImage imageNamed:@"luisterbutton"];
            self.glistenbutton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.glistenbutton.frame = CGRectMake(self.frame.size.width/2 - listenbutton.size.width/2, self.frame.size.height, listenbutton.size.width, listenbutton.size.height);
            [self.glistenbutton setBackgroundImage:listenbutton forState:UIControlStateNormal];
            [self addSubview:self.glistenbutton];
            [UIView animateWithDuration:0.7f animations:^{
                CGRect frame = self.glistenbutton.frame;
                frame.origin.y -= 80;
                self.glistenbutton.frame = frame;
            } completion:^(BOOL finished){}];
        }else if(self.assignment.categoryid == 3 && self.assignment.type == 2){
            NSLog(@"[AssignmentView] Assignment is of type: %i, and category: %i - check",self.assignment.type, self.assignment.categoryid);
            UIImage *checkbutton = [UIImage imageNamed:@"checkbutton"];
            self.gcheckbutton = [UIButton buttonWithType:UIButtonTypeCustom];
            self.gcheckbutton.frame = CGRectMake(self.frame.size.width/2 - checkbutton.size.width/2, self.frame.size.height, checkbutton.size.width, checkbutton.size.height);
            [self.gcheckbutton setBackgroundImage:checkbutton forState:UIControlStateNormal];
            [self addSubview:self.gcheckbutton];
            [UIView animateWithDuration:0.7f animations:^{
                CGRect frame = self.gcheckbutton.frame;
                frame.origin.y -= 80;
                self.gcheckbutton.frame = frame;
            } completion:^(BOOL finished){}];
        }else if(self.assignment.type == 1){
            NSLog(@"[AssignmentView] Custom action required");
            if (self.assignment.identifier == 1) {
                NSLog(@"[AssignmentView] Go to volume checker app");
                UIImage *listenbutton = [UIImage imageNamed:@"luisterbutton"];
                self.volumebutton = [UIButton buttonWithType:UIButtonTypeCustom];
                self.volumebutton.frame = CGRectMake(self.frame.size.width/2 - listenbutton.size.width/2, self.frame.size.height, listenbutton.size.width, listenbutton.size.height);
                [self.volumebutton setBackgroundImage:listenbutton forState:UIControlStateNormal];
                [self addSubview:self.volumebutton];
                [UIView animateWithDuration:0.7f animations:^{
                    CGRect frame = self.volumebutton.frame;
                    frame.origin.y -= 80;
                    self.volumebutton.frame = frame;
                } completion:^(BOOL finished){}];
            }else if (self.assignment.identifier == 3) {
                NSLog(@"[AssignmentView] Go to quote app");
                UIImage *photobutton = [UIImage imageNamed:@"fotobutton"];
                self.quotebutton = [UIButton buttonWithType:UIButtonTypeCustom];
                self.quotebutton.frame = CGRectMake(self.frame.size.width/2 - photobutton.size.width/2, self.frame.size.height, photobutton.size.width, photobutton.size.height);
                [self.quotebutton setBackgroundImage:photobutton forState:UIControlStateNormal];
                [self addSubview:self.quotebutton];
                [UIView animateWithDuration:0.7f animations:^{
                    CGRect frame = self.quotebutton.frame;
                    frame.origin.y -= 80;
                    self.quotebutton.frame = frame;
                } completion:^(BOOL finished){}];
            }else if (self.assignment.identifier == 4) {
                NSLog(@"[AssignmentView] Go to green app");
                UIImage *photobutton = [UIImage imageNamed:@"fotobutton"];
                self.greenbutton = [UIButton buttonWithType:UIButtonTypeCustom];
                self.greenbutton.frame = CGRectMake(self.frame.size.width/2 - photobutton.size.width/2, self.frame.size.height, photobutton.size.width, photobutton.size.height);
                [self.greenbutton setBackgroundImage:photobutton forState:UIControlStateNormal];
                [self addSubview:self.greenbutton];
                [UIView animateWithDuration:0.7f animations:^{
                    CGRect frame = self.greenbutton.frame;
                    frame.origin.y -= 80;
                    self.greenbutton.frame = frame;
                } completion:^(BOOL finished){}];
            }
            
        }
        
        self.imageView = [[UIImageView alloc]initWithFrame:frame];
        [self addSubview:self.imageView];
        
    }
    return self;
}

//- (void)animateIllustration
//{
//    NSLog(@"ANIMATE");
//    self.illImageView = [[UIImageView alloc] initWithImage:self.illustration];
//    self.illImageView.frame = CGRectMake(0, 0, 10, 10);
//    self.illImageView.alpha = 0;
//    self.illImageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
//    [self addSubview:self.illImageView];
//    [UIView animateWithDuration:0.85 animations:^{
//        CGRect frame = self.illImageView.frame;
//        frame.size.width += self.frame.size.width*0.7;
//        frame.size.height += self.frame.size.height*0.7;
//        self.illImageView.frame = frame;
//        self.illImageView.alpha = 1.0f;
//    }
//                     completion:^(BOOL finished){
//                         [UIView animateWithDuration:0.3 animations:^{
//                             CGRect frame = self.illImageView.frame;
//                             frame.size.width -= self.frame.size.width*0.1;
//                             frame.size.height -= self.frame.size.height*0.1;
//                             self.illImageView.frame = frame;
//                         }];
//                     }];
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
