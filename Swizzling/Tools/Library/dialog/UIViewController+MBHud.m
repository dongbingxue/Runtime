//
//  UIViewController+MBHud.m
//  mcapp
//
//  Created by ios on 14/11/25.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "UIViewController+MBHud.h"
#import <objc/runtime.h>

static char MBHud;
@implementation UIViewController (MBHud)

- (void)setHud:(MBProgressHUD *)hud {
    [self willChangeValueForKey:@"MBProgressHUD"];
    objc_setAssociatedObject(self, &MBHud,
                             hud,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"MBProgressHUD"];
}

- (MBProgressHUD *)hud {
    return objc_getAssociatedObject(self, &MBHud);
}

-(void)loadHudInKeyWindow{
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithWindow:[UIApplication sharedApplication].keyWindow];
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    self.hud = hud;
}

-(void)loadHud:(UIView *)view{
    if(!self.hud){
        MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:view];
        self.hud = hud;
    }
    [view addSubview:self.hud];
}

-(MBProgressHUD *)showHudProgress:(NSString *)text{
    if (self.hud.superview) {
        [self.hud.superview bringSubviewToFront:self.hud];
    }
    self.hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    self.hud.labelText = text;
    [self.hud show:YES];
    return self.hud;
}

-(void)showHudIndeterminate:(NSString *)text{
    if (self.hud.superview) {
        [self.hud.superview bringSubviewToFront:self.hud];
    }
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.labelText = text;
    [self.hud show:YES];
}

-(void)showSimpleHud{
    if (self.hud.superview) {
        [self.hud.superview bringSubviewToFront:self.hud];
    }
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.labelText = nil;
    [self.hud show:YES];
}

-(void)hideHudSuccess:(NSString *)text{
    self.hud.mode = MBProgressHUDModeCustomView;
//    self.hud.customView = [IconFont labelWithIcon:[IconFont icon:@"fa_check" fromFont:fontAwesome] fontName:fontAwesome size:37.0f color:[UIColor whiteColor]];
    self.hud.labelText = text;
    [self.hud hide:YES afterDelay:1.0f];
}

-(void)hideHud{
    [self.hud hide:YES];
}

-(void)hideHudFailed:(NSString *)text{
    self.hud.mode = MBProgressHUDModeCustomView;
//    self.hud.customView = [IconFont labelWithIcon:[IconFont icon:@"fa_times" fromFont:fontAwesome] fontName:fontAwesome size:37.0f color:[UIColor whiteColor]];
    self.hud.labelText = text;
    [self.hud hide:YES afterDelay:1.0f];
}

@end
