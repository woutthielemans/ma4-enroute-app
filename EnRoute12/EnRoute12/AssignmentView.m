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
        self.backgroundColor = [UIColor whiteColor];
        
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
        
        textView.attributedText = attributedString;
        textView.editable = NO;
        [self addSubview:textView];
        
        if(assignment.categoryid == 1 && assignment.type == 2){
            NSLog(@"[AssignmentView] Assignment is of type: %i, and category: %i - photo",assignment.type, assignment.categoryid);
        }else if(assignment.categoryid == 2 && assignment.type == 2){
            NSLog(@"[AssignmentView] Assignment is of type: %i, and category: %i - sound",assignment.type, assignment.categoryid);
        }else if(assignment.categoryid == 3 && assignment.type == 2){
            NSLog(@"[AssignmentView] Assignment is of type: %i, and category: %i - check",assignment.type, assignment.categoryid);
        }else if(assignment.type == 1){
            NSLog(@"[AssignmentView] Custom action required");
            if (assignment.identifier == 1) {
                NSLog(@"[AssignmentView] Go to volume checker app");
            }else if (assignment.identifier == 3) {
                NSLog(@"[AssignmentView] Go to quote app");
            }else if (assignment.identifier == 4) {
                NSLog(@"[AssignmentView] Go to green app");
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
