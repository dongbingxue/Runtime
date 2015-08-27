//
//  UIScrollView+EndReflash.h
//  mcapp
//
//  Created by ios on 14/11/28.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (EndReflash)
-(void)flashMessage:(NSString *)msg;
-(void)endAllRefreshingWithEnd:(BOOL)isEnd;
-(void)endAllRefreshingWithIntEnd:(NSInteger)num;
@end
