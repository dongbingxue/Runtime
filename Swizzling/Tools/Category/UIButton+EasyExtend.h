//
//  UIButton+EasyExtend.h
//  leway
//
//  Created by ios on 14-6-7.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EzSystemInfo.h"
@interface UIButton (EasyExtend)
-(UIButton *)initNavigationButton:(UIImage *)image;
-(UIButton *)initNavigationButtonWithTitle:(NSString *)str color:(UIColor *)color;
@end
