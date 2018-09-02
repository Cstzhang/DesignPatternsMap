//
//  GaodeMapUserLocation.h
//  MapTools
//
//  Created by zhangzb on 2018/8/26.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUserLocation.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
@interface GaodeMapUserLocation : NSObject<IUserLocation>
- (instancetype)initWithLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode;
@end
//1:1:10
