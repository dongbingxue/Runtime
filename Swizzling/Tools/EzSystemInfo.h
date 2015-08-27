//  Created by ios on 15-4-10.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "EzSingleton.h"

#define SCREEN_ORIGIN_WIDTH (CGRectGetWidth([[UIScreen mainScreen] bounds]))
#define SCREEN_ORIGIN_HEIGHT (CGRectGetHeight([[UIScreen mainScreen] bounds]))

#define IS_OrientationIsLandscape ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)

#define SCREEN_WIDTH (IS_OrientationIsLandscape ? MAX (SCREEN_ORIGIN_WIDTH, SCREEN_ORIGIN_HEIGHT) : MIN (SCREEN_ORIGIN_WIDTH, SCREEN_ORIGIN_HEIGHT))
#define SCREEN_HEIGHT (IS_OrientationIsLandscape ? MIN (SCREEN_ORIGIN_WIDTH, SCREEN_ORIGIN_HEIGHT) : MAX (SCREEN_ORIGIN_WIDTH, SCREEN_ORIGIN_HEIGHT))

#define KSTATUSBAR_HEIGHT 20.0f
#define KNAVBAR_HEIGHT 44.0f
#define KTABBAR_HEIGHT 50.0f
#define KSTATUS_NAV_HEIGHT 64.0f

#define KVIEW_WITHSTATUS_HEIGHT (SCREEN_HEIGHT - KSTATUSBAR_HEIGHT)
#define KVIEW_WITHNAV_HEIGHT (SCREEN_HEIGHT - KSTATUS_NAV_HEIGHT)
#define KVIEW_WITHTAB_HEIGHT (SCREEN_HEIGHT - KSTATUS_NAV_HEIGHT - KTABBAR_HEIGHT)

extern const BOOL IOS8_OR_LATER;
extern const BOOL IOS7_OR_LATER;
extern const BOOL IOS6_OR_LATER;
extern const BOOL IOS5_OR_LATER;
extern const BOOL IOS4_OR_LATER;
extern const BOOL IOS3_OR_LATER;

extern const BOOL IOS7_OR_EARLIER;
extern const BOOL IOS6_OR_EARLIER;
extern const BOOL IOS5_OR_EARLIER;
extern const BOOL IOS4_OR_EARLIER;
extern const BOOL IOS3_OR_EARLIER;

extern const BOOL IS_SCREEN_35_INCH;
extern const BOOL IS_SCREEN_4_INCH;
extern const BOOL IS_SCREEN_47_INCH;
extern const BOOL IS_SCREEN_55_INCH;

//extern const float SCREEN_WIDTH;
//extern const float SCREEN_HEIGHT;

//extern const float KSTATUSBAR_HEIGHT;
//extern const float KNAVBAR_HEIGHT;
//extern const float KTABBAR_HEIGHT;
//extern const float KSTATUS_NAV_HEIGHT;
//
//extern const float KVIEW_WITHSTATUS_HEIGHT;
//extern const float KVIEW_WITHNAV_HEIGHT;
//extern const float KVIEW_WITHTAB_HEIGHT;

@interface EzSystemInfo : NSObject

AS_SINGLETON( EzSystemInfo )

+ (NSString *)OSVersion;
+ (NSString *)appVersion;
+ (NSString *)appIdentifier;
+ (NSString *)appSchema;
+ (NSString *)appSchema:(NSString *)name;
+ (NSString *)deviceModel;

+ (BOOL)isJailBroken		NS_AVAILABLE_IOS(4_0);
+ (NSString *)jailBreaker	NS_AVAILABLE_IOS(4_0);

+ (BOOL)isDevicePhone;
+ (BOOL)isDevicePad;

+ (BOOL)requiresPhoneOS;

+ (BOOL)isPhone;
+ (BOOL)isPhone35;
+ (BOOL)isPhoneRetina35;
+ (BOOL)isPhoneRetina4;
+ (BOOL)isPad;
+ (BOOL)isPadRetina;
+ (BOOL)isScreenSize:(CGSize)size;

@end
