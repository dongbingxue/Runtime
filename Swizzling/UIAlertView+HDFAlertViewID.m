//
//  UIAlertView+HDFAlertViewID.m
//  newPatient
//
//  Created by dbx on 15/8/25.
//  Copyright (c) 2015年 shilinglong. All rights reserved.
//

#import "UIAlertView+HDFAlertViewID.h"
#import <objc/runtime.h>

//给uialertview 动态绑定一个属性
static char *kApsID;

@implementation UIAlertView (HDFAlertViewID)

- (NSString *)apsID{
    return objc_getAssociatedObject(self, kApsID);
}

- (void)setApsID:(NSString *)apsID{
    objc_setAssociatedObject(self, kApsID, apsID, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
