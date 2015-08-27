//
//  UIView+EasyExtend.h
//  leway
//
//  Created by ios on 14-6-5.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (EasyExtend)
-(CGFloat)bottom;
-(CGFloat)top;
-(CGFloat)left;
-(CGFloat)right;
-(CGFloat)width;
-(CGFloat)height;
- (UIImage *)saveImageWithScale:(float)scale;

/**
 *  Pins the subview of the receiver to the edge of its frame, as specified by the given attribute, by adding a layout constraint.
 *
 *  @param subview   The subview to which the receiver will be pinned.
 *  @param attribute The layout constraint attribute specifying one of `NSLayoutAttributeBottom`, `NSLayoutAttributeTop`, `NSLayoutAttributeLeading`, `NSLayoutAttributeTrailing`.
 */
- (void)jsq_pinSubview:(UIView *)subview toEdge:(NSLayoutAttribute)attribute;

/**
 *  Pins all edges of the specified subview to the receiver.
 *
 *  @param subview The subview to which the receiver will be pinned.
 */
- (void)jsq_pinAllEdgesOfSubview:(UIView *)subview;
@end
