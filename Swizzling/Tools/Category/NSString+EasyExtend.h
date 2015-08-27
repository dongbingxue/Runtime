//
//  NSString+EasyExtend.h
//  fastSign
//
//  Created by ios on 15-4-10.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString (EasyExtend)
//#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
//- (CGSize)sizeWithFont:(UIFont *)font byWidth:(CGFloat)width;
//- (CGSize)sizeWithFont:(UIFont *)font byHeight:(CGFloat)height;
//#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
- (NSString *)MD5;
- (NSString *)substringFromIndex:(NSUInteger)from untilCharset:(NSCharacterSet *)charset endOffset:(NSUInteger *)endOffset;
- (NSString *)trim;
- (NSArray *)words;
- (NSString *)getOutOfTheNumber;
- (NSString *)urldecode;
- (NSString *)urlencode;
- (NSString *)urlByAppendingDict:(NSDictionary *)params encoding:(BOOL)encoding;
- (NSString *)getNameFromAddressBookWithPhoneNum;
- (NSString *)firstLetter;
- (NSString *)firstLetters;
+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;
+ (NSString *)jsonStringWithArray:(NSArray *)array;
+ (NSString *)jsonStringWithString:(NSString *) string;
+ (NSString *)jsonStringWithObject:(id) object;
-(NSString *)safeString;
- (NSString *)stringByTrimmingLeadingWhitespaceAndNewlineCharacters;
- (NSString *)stringByTrimmingTrailingWhitespaceAndNewlineCharacters;
- (NSString *)jsq_stringByTrimingWhitespace;
- (NSString *)trimWhitespace;
- (NSUInteger)numberOfLines;
@end

@interface NSMutableString (EasyExtend)

typedef NSMutableString *	(^NSMutableStringAppendBlock)( id format, ... );
@property(nonatomic,readonly) NSMutableStringAppendBlock APPEND;
+(NSMutableString *)stringFromResFile:(NSString *)name encoding:(NSStringEncoding)encode;
@end