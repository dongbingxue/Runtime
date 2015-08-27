//
//  NSData+EasyExtend.h
//  fastSign
//
//  Created by ios on 15-4-10.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
@interface NSData (EasyExtend)

@property (nonatomic, readonly) NSData *	MD5;
@property (nonatomic, readonly) NSString *	MD5String;

+ (NSData *)fromResource:(NSString *)resName;

@end
