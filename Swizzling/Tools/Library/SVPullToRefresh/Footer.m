//
//  Footer.m
//  mcapp
//
//  Created by ios on 14/11/21.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "Footer.h"
#import "SVPullToRefresh.h"

@implementation Footer

- (id)initWithScrollView:(UIScrollView *)scrollView{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - Scroll View

- (void)resetScrollViewContentInset:(UIScrollView *)scrollView {
    UIEdgeInsets currentInsets = scrollView.contentInset;
    CGFloat newBottom  = scrollView.infiniteScrollingView.originalBottomInset + scrollView.infiniteScrollingView.extendBottom;
    if (newBottom != currentInsets.bottom) {
        currentInsets.bottom = newBottom;
        [self setScrollViewContentInset:currentInsets scrollView:scrollView];
    }
}

- (void)setScrollViewContentInsetForInfiniteScrolling:(UIScrollView *)scrollView {
    UIEdgeInsets currentInsets = scrollView.contentInset;
    CGFloat newBottom  = scrollView.infiniteScrollingView.originalBottomInset + scrollView.infiniteScrollingView.extendBottom + SVInfiniteScrollingViewHeight;
    if (newBottom != currentInsets.bottom) {
        currentInsets.bottom = newBottom;
        [self setScrollViewContentInset:currentInsets scrollView:scrollView];
    }
}

- (void)setScrollViewContentInset:(UIEdgeInsets)contentInset scrollView:(UIScrollView *)scrollView {
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         scrollView.contentInset = contentInset;
                     }
                     completion:NULL];
}

@end
