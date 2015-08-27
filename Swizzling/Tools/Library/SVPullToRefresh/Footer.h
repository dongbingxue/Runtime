//
//  Footer.h
//  mcapp
//
//  Created by ios on 14/11/21.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Footer : UIView
- (id)initWithScrollView:(UIScrollView *)scrollView;
- (void)resetScrollViewContentInset:(UIScrollView *)scrollView;
- (void)setScrollViewContentInsetForInfiniteScrolling:(UIScrollView *)scrollView;
@end
