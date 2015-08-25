//
//  UIViewController+Swizzling.m
//  Swizzling
//
//  Created by dbx on 15/8/25.
//  Copyright (c) 2015年 shilinglong. All rights reserved.
//

#import "UIViewController+Swizzling.h"
#import <objc/runtime.h>

@implementation UIViewController (Swizzling)


+ (void)load{
    SEL originalSelector = @selector(viewWillAppear:);
    SEL swizzleSelector = @selector(swi_viewWillAppear:);
    Method originalMethod = class_getInstanceMethod([self class], originalSelector);
    Method swizzleMethod = class_getInstanceMethod([self class], swizzleSelector);
    method_exchangeImplementations(originalMethod, swizzleMethod);
    
}


- (void)swi_viewWillAppear:(BOOL)animated{
    
    [self swi_viewWillAppear:animated];
    NSLog(@"%@",NSStringFromClass([self class]));
}


@end
