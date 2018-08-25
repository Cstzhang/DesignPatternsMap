//
//  BaiduMapUserLocation.h
//  MapTools
//
//  Created by zhangzb on 2018/8/23.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUserLocation.h"
#import <BaiduMapAPI_Location/BMKLocationService.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>

@interface BaiduMapUserLocation : NSObject<IUserLocation>

- (instancetype)initWithUserLocation:(BMKUserLocation *)userLocation;
@end
