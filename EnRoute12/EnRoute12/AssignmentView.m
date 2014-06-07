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
        self.backgroundColor = [UIColor blackColor];
    
        if(assignment.illustration2){
            
            self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
            [self addSubview:self.scrollView];
            
            
            self.scrollView.pagingEnabled = YES;
            self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
            self.pageControl.numberOfPages = 3;
            CGSize sizeOfPageControl = [self.pageControl sizeForNumberOfPages:self.pageControl.numberOfPages];
            self.pageControl.frame = CGRectMake(0, 0, sizeOfPageControl.width, sizeOfPageControl.height);
            self.pageControl.center = CGPointMake(self.frame.size.width/2, self.frame.size.height - (sizeOfPageControl.height/2));
            [self addSubview:self.pageControl];
            
        }else{
            
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
