//
//  UIScrollView+EndReflash.m
//  mcapp
//
//  Created by ios on 14/11/28.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "UIScrollView+EndReflash.h"
#import <objc/runtime.h>
#import "SVPullToRefresh.h"

static char MsgLabel;

@implementation UIScrollView (EndReflash)


- (void)setMsgLabel:(UILabel *)msgLabel {
    [self willChangeValueForKey:@"MsgLabel"];
    objc_setAssociatedObject(self, &MsgLabel,
                             msgLabel,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"MsgLabel"];
}

- (UILabel *)msgLabel {
    return objc_getAssociatedObject(self, &MsgLabel);
}

- (void)flashMessage:(NSString *)msg {
    //Show message
    __block CGRect rect = CGRectMake(0, - 20, self.bounds.size.width, 20);
    if (self.msgLabel == nil) {
        self.msgLabel = [[UILabel alloc] init];
        self.msgLabel.frame = rect;
        self.msgLabel.font = [UIFont systemFontOfSize:14.f];
        self.msgLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.msgLabel.backgroundColor = [UIColor redColor];
        self.msgLabel.textColor = [UIColor whiteColor];
        self.msgLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.msgLabel];
    }
    self.msgLabel.text = msg;
    
    rect.origin.y += 20;
    [UIView animateWithDuration:.4f animations: ^{
        self.msgLabel.frame = rect;
    } completion: ^(BOOL finished) {
        rect.origin.y -= 20;
        [UIView animateWithDuration:.4f delay:1.2f options:UIViewAnimationOptionCurveLinear animations: ^{
            self.msgLabel.frame = rect;
        } completion: ^(BOOL finished) {
            [self.msgLabel removeFromSuperview];
            self.msgLabel = nil;
        }];
    }];
}

-(void)endAllRefreshingWithEnd:(BOOL)isEnd{
    if(self.pullToRefreshView !=nil && self.pullToRefreshView.state == SVPullToRefreshStateLoading){
        if (self.infiniteScrollingView !=nil) {
            [self.infiniteScrollingView resetState];
        }
        [self.pullToRefreshView stopAnimating];
    }
    if(self.infiniteScrollingView !=nil){
        if(isEnd){
            [self.infiniteScrollingView setEnded];
        }else if(self.infiniteScrollingView.state == SVInfiniteScrollingStateLoading){
            [self.infiniteScrollingView stopAnimating];
        }else{
            [self.infiniteScrollingView resetState];
        }
    }
}

-(void)endAllRefreshingWithIntEnd:(NSInteger)num{
    BOOL isEnd = NO;
    if (num == 1) {
        isEnd = YES;
    }
    [self endAllRefreshingWithEnd:isEnd];
}

@end
