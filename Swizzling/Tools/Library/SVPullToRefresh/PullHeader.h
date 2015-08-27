//
//  PullHeader.h
//  mcapp
//
//  Created by ios on 14/11/21.
//  Copyright (c) 2015年 ios. All rights reserved.
//

#import "Header.h"

@interface PullHeader : Header
@property(nonatomic,retain)UILabel *statusLabel;
@property(nonatomic,retain)UILabel *lastUpdateTimeLabel;
@property(nonatomic,retain)UIImageView *arrowImage;
@property(nonatomic,retain)UIActivityIndicatorView *activityView;

@end
