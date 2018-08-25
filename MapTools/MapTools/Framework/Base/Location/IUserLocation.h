//
//  IUserLocation.h
//  MapTools
//
//  Created by zhangzb on 2018/8/22.
//  Copyright © 2018年 zhangzb. All rights reserved.
//
#import <CoreLocation/CLLocation.h>
#import <Foundation/Foundation.h>
@class CLLocation;
@class CLHeading;
//定位返回的信息协议
@protocol IUserLocation <NSObject>
//返回指定定位数据
- (id)getObject;

/// 位置更新状态，如果正在更新位置信息，则该值为YES
- (BOOL) updating;

/// 位置信息，尚未定位成功，则该值为nil
- (CLLocation*)getLocation;

/// heading信息，尚未定位成功，则该值为nil
- (CLHeading*)getHeading;

/// 定位标注点要显示的标题信息
- (NSString*)getTitle;

/// 定位标注点要显示的子标题信息.
- (NSString*)getSubtitle;
@end
