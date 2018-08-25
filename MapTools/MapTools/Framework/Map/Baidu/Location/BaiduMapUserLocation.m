//
//  BaiduMapUserLocation.m
//  MapTools
//
//  Created by zhangzb on 2018/8/23.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import "BaiduMapUserLocation.h"

@interface BaiduMapUserLocation()
/** <#注释#> */
@property (nonatomic) BMKUserLocation * userLocation;
@end



@implementation BaiduMapUserLocation

- (instancetype)initWithUserLocation:(BMKUserLocation *)userLocation
{
    self = [super init];
    if (self) {
        _userLocation = userLocation;
    }
    return self;
}

- (id)getObject{
    return _userLocation;
}

/// 位置更新状态，如果正在更新位置信息，则该值为YES
- (BOOL) updating{
    return _userLocation.isUpdating;
}

/// 位置信息，尚未定位成功，则该值为nil
- (CLLocation*)getLocation{
    return _userLocation.location;
}

/// heading信息，尚未定位成功，则该值为nil
- (CLHeading*)getHeading{
    return _userLocation.heading;
}

/// 定位标注点要显示的标题信息
- (NSString*)getTitle{
    return _userLocation.title;
}

/// 定位标注点要显示的子标题信息.
- (NSString*)getSubtitle{
    return _userLocation.subtitle;
}
@end
