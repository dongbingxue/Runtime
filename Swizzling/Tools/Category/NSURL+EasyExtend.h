//
//  NSURL+EasyExtend.h
//  leway
//
//  Created by ios on 14-6-5.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (EasyExtend)
- (NSURL *)addParams:(NSDictionary *)params;
- (NSDictionary *)params;
@end
