//
//  GaodeMapUserLocation.m
//  MapTools
//
//  Created by zhangzb on 2018/8/26.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import "GaodeMapUserLocation.h"


@interface GaodeMapUserLocation ()
@property (nonatomic) CLLocation * location;
@property (nonatomic) AMapLocationReGeocode *reGeocode;
@end

@implementation GaodeMapUserLocation

- (instancetype)initWithLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode
{
    self = [super init];
    if (self) {
        _location =location;
        _reGeocode = reGeocode;
    }
    return self;
}

//返回指定定位数据
- (id)getObject{
    return _reGeocode;
}

/// 位置更新状态，如果正在更新位置信息，则该值为YES
- (BOOL) updating{
    return YES;
}

/// 位置信息，尚未定位成功，则该值为nil
- (CLLocation*)getLocation{
    return _location;
}

/// heading信息，尚未定位成功，则该值为nil
- (CLHeading*)getHeading{
    return nil;
}

/// 定位标注点要显示的标题信息
- (NSString*)getTitle{
    return nil;
}

/// 定位标注点要显示的子标题信息.
- (NSString*)getSubtitle{
    return nil;
}
@end
