//
//  NSArray+Swizzle.m
//  Swizzling
//
//  Created by dbx on 15/8/25.
//  Copyright (c) 2015年 shilinglong. All rights reserved.
//

#import "NSArray+Swizzle.h"

@implementation NSArray (Swizzle)
-(id)myLastObject{
    id ret = [self myLastObject];
    NSLog(@"myLastObject");
    return ret;
}


@end
