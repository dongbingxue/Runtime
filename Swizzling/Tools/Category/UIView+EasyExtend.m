//
//  UIView+EasyExtend.m
//  leway
//
//  Created by ios on 14-6-5.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "UIView+EasyExtend.h"

@implementation UIView (EasyExtend)

-(CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}
-(CGFloat)top{
    return self.frame.origin.y;
}
-(CGFloat)left{
    return self.frame.origin.x;
}
-(CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}
-(CGFloat)width{
    return self.frame.size.width;
}
-(CGFloat)height{
    return self.frame.size.height;
}
- (UIImage *)saveImageWithScale:(float)scale
{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)jsq_pinSubview:(UIView *)subview toEdge:(NSLayoutAttribute)attribute
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:attribute
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:subview
                                                     attribute:attribute
                                                    multiplier:1.0f
                                                      constant:0.0f]];
}

- (void)jsq_pinAllEdgesOfSubview:(UIView *)subview
{
    [self jsq_pinSubview:subview toEdge:NSLayoutAttributeBottom];
    [self jsq_pinSubview:subview toEdge:NSLayoutAttributeTop];
    [self jsq_pinSubview:subview toEdge:NSLayoutAttributeLeading];
    [self jsq_pinSubview:subview toEdge:NSLayoutAttributeTrailing];
}

@end
