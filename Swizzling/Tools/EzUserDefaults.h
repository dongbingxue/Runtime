//  Created by ios on 15-4-10.
//  Copyright (c) 2015年 ios. All rights reserved.
//
#import "BaseFramework.h"
#import "EzCacheProtocol.h"
#pragma mark -

#define AS_USERDEFAULT( __name )	AS_STATIC_PROPERTY( __name )
#define DEF_USERDEFAULT( __name )	DEF_STATIC_PROPERTY3( __name, @"userdefault", [self description] )

#pragma mark -

@interface EzUserDefaults : NSObject<EzCacheProtocol>

AS_SINGLETON( EzUserDefaults )

@end
