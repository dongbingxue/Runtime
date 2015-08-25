//
//  NSObject+RNSwizzle.h
//  Swizzling
//
//  Created by dbx on 15/8/25.
//  Copyright (c) 2015年 shilinglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RNSwizzle)
+(IMP)swizzleSelector: (SEL)origSelector withIMP:(IMP)newIMP;
@end
