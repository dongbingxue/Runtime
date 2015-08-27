//
//  Header.h
//  mcapp
//
//  Created by ios on 14/11/21.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Header : UIView
- (id)initWithScrollView:(UIScrollView *)scrollView;
- (void)resetScrollViewContentInset:(UIScrollView *)scrollView;
- (void)setScrollViewContentInsetForLoading:(UIScrollView *)scrollView;
@end
