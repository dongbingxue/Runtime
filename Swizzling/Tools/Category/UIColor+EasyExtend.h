//  Created by ios on 15-4-10.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import <UIKit/UIKit.h>
#pragma mark -

#undef	RGB
#define RGB(R,G,B)		[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]

#undef	RGBA
#define RGBA(R,G,B,A)	[UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#undef	HEX_RGB
#define HEX_RGB(V)		[UIColor fromHexValue:V]

#undef	HEX_RGBA
#define HEX_RGBA(V, A)	[UIColor fromHexValue:V alpha:A]

#undef	SHORT_RGB
#define SHORT_RGB(V)	[UIColor fromShortHexValue:V]

#undef	HEXSTR_RGB
#define HEXSTR_RGB(V)	[UIColor colorWithHexString:V]

#undef	HEXSTR_RGBA
#define HEXSTR_RGBA(V, A)	[UIColor colorWithHexString:V alpha:A]

#pragma mark -

@interface UIColor(EasyExtend)

+ (UIColor *)fromHexValue:(NSUInteger)hex;
+ (UIColor *)fromHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)fromShortHexValue:(NSUInteger)hex;
+ (UIColor *)fromShortHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)colorWithString:(NSString *)string; // {#FFF|#FFFFFF|#FFFFFFFF}{,0.6}

+ (UIColor *) colorWithHexString: (NSString *) hexString;
+ (UIColor *) colorWithHexString: (NSString *) hexString alpha:(CGFloat)alpha;

@end

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
