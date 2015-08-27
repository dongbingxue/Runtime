//  Created by ios on 15-4-10.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#import "UIColor+EasyExtend.h"

#pragma mark -

@implementation UIColor(EasyExtend)

+ (UIColor *)fromHexValue:(NSUInteger)hex
{
	NSUInteger a = ((hex >> 24) & 0x000000FF);
	float fa = ((0 == a) ? 1.0f : (a * 1.0f) / 255.0f);

	return [UIColor fromHexValue:hex alpha:fa];
}

+ (UIColor *)fromHexValue:(NSUInteger)hex alpha:(CGFloat)alpha
{
    if ( hex == 0xECE8E3 ) {
        
    }
	NSUInteger r = ((hex >> 16) & 0x000000FF);
	NSUInteger g = ((hex >> 8) & 0x000000FF);
	NSUInteger b = ((hex >> 0) & 0x000000FF);
	
	float fr = (r * 1.0f) / 255.0f;
	float fg = (g * 1.0f) / 255.0f;
	float fb = (b * 1.0f) / 255.0f;
	
	return [UIColor colorWithRed:fr green:fg blue:fb alpha:alpha];
}

+ (UIColor *)fromShortHexValue:(NSUInteger)hex
{
	return [UIColor fromShortHexValue:hex alpha:1.0f];
}

+ (UIColor *)fromShortHexValue:(NSUInteger)hex alpha:(CGFloat)alpha
{
	NSUInteger r = ((hex >> 8) & 0x0000000F);
	NSUInteger g = ((hex >> 4) & 0x0000000F);
	NSUInteger b = ((hex >> 0) & 0x0000000F);
	
	float fr = (r * 1.0f) / 15.0f;
	float fg = (g * 1.0f) / 15.0f;
	float fb = (b * 1.0f) / 15.0f;
	
	return [UIColor colorWithRed:fr green:fg blue:fb alpha:alpha];
}

+ (UIColor *)colorWithString:(NSString *)string
{
	if ( nil == string || 0 == string.length )
		return nil;

	string = string.trim;

	if ( [string hasPrefix:@"rgb("] && [string hasSuffix:@")"] )
	{
		string = [string substringWithRange:NSMakeRange(4, string.length - 5)];
		if ( string && string.length )
		{
			NSArray * elems = [string componentsSeparatedByString:@","];
			if ( elems && elems.count == 3 )
			{
				NSInteger r = [[elems objectAtIndex:0] integerValue];
				NSInteger g = [[elems objectAtIndex:1] integerValue];
				NSInteger b = [[elems objectAtIndex:2] integerValue];
				
				return [UIColor colorWithRed:(r * 1.0f / 255.0f) green:(g * 1.0f / 255.0f) blue:(b * 1.0f / 255.0f) alpha:1.0f];
			}
		}
	}
	
	NSArray *	array = [string componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *	color = [array objectAtIndex:0];
    CGFloat		alpha = 1.0f;

	if ( array.count == 2 )
    {
        alpha = [[array objectAtIndex:1] floatValue];
    }

    if ( [color hasPrefix:@"#"] ) // #FFF
    {
		color = [color substringFromIndex:1];

		if ( color.length == 3 )
		{
			NSUInteger hexRGB = strtol(color.UTF8String , nil, 16);
			return [UIColor fromShortHexValue:hexRGB alpha:alpha];
		}
		else if ( color.length == 6 )
		{
			NSUInteger hexRGB = strtol(color.UTF8String , nil, 16);
			return [UIColor fromHexValue:hexRGB alpha:alpha];
		}
    }
    else if ( [color hasPrefix:@"0x"] || [color hasPrefix:@"0X"] ) // #FFF
    {
		color = [color substringFromIndex:2];
		
		if ( color.length == 8 )
		{
			NSUInteger hexRGB = strtol(color.UTF8String , nil, 16);
			return [UIColor fromHexValue:hexRGB];
		}
		else if ( color.length == 6 )
		{
			NSUInteger hexRGB = strtol(color.UTF8String , nil, 16);
			return [UIColor fromHexValue:hexRGB alpha:1.0f];
		}
	}
    else
    {
        static NSMutableDictionary * __colors = nil;
        
        if ( nil == __colors )
        {
            __colors = [[NSMutableDictionary alloc] init];
            [__colors setObject:[UIColor clearColor]		forKey:@"clear"];
            [__colors setObject:[UIColor clearColor]		forKey:@"transparent"];
            [__colors setObject:[UIColor redColor]			forKey:@"red"];
            [__colors setObject:[UIColor blackColor]		forKey:@"black"];
            [__colors setObject:[UIColor darkGrayColor]		forKey:@"darkgray"];
            [__colors setObject:[UIColor lightGrayColor]	forKey:@"lightgray"];
            [__colors setObject:[UIColor whiteColor]		forKey:@"white"];
            [__colors setObject:[UIColor grayColor]			forKey:@"gray"];
            [__colors setObject:[UIColor greenColor]		forKey:@"green"];
            [__colors setObject:[UIColor blueColor]			forKey:@"blue"];
            [__colors setObject:[UIColor cyanColor]			forKey:@"cyan"];
            [__colors setObject:[UIColor yellowColor]		forKey:@"yellow"];
            [__colors setObject:[UIColor magentaColor]		forKey:@"magenta"];
            [__colors setObject:[UIColor orangeColor]		forKey:@"orange"];
            [__colors setObject:[UIColor purpleColor]		forKey:@"purple"];
            [__colors setObject:[UIColor brownColor]		forKey:@"brown"];
        }

        UIColor *setColor = [__colors objectForKey:color.lowercaseString];
		if ( setColor )
		{
			return [setColor colorWithAlphaComponent:alpha];
		}
    }

    return nil;
}

+ (UIColor *) colorWithHexString: (NSString *) hexString
{
    return [UIColor colorWithHexString:hexString alpha:1];
}

+ (UIColor *) colorWithHexString: (NSString *) hexString alpha:(CGFloat)parAlpha{
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = parAlpha;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = parAlpha;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            alpha = 1.0f;
            red   = 1.0f;
            green = 1.0f;
            blue  = 1.0f;
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
    
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

@end

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)