//
//  UIViewController+MBHud.h
//  mcapp
//
//  Created by ios on 14/11/25.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface UIViewController (MBHud)
-(void)loadHudInKeyWindow;
-(void)loadHud:(UIView *)view;
-(MBProgressHUD *)showHudProgress:(NSString *)text;
-(void)showHudIndeterminate:(NSString *)text;
-(void)hideHud;
-(void)hideHudSuccess:(NSString *)text;
-(void)showSimpleHud;
@end
