//
//  GaodeMapLocationService.m
//  MapTools
//
//  Created by zhangzb on 2018/8/25.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import "GaodeMapLocationService.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
#import "GaodeMapUserLocation.h"
@interface GaodeMapLocationService()<AMapLocationManagerDelegate>
@property (nonatomic) AMapLocationManager * locationManager;
@property (nonatomic) id<ILocationServiceDelegate> delegate;


@end

@implementation GaodeMapLocationService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _locationManager = [[AMapLocationManager alloc]init];
     
    }
    return self;
}


  //启动定位
- (void)startUserLocationService{
    [_locationManager startUpdatingLocation];
    
}

//定义回调协议
- (void)setDelegate:(id<ILocationServiceDelegate>)delegate{
    _delegate = delegate;
    if (_delegate == nil) {
        _locationManager.delegate = nil;
    }else{
        _locationManager.delegate = self;
        
    }
    
}

//停止定位
- (void)stopUserLocationService{
    
    [_locationManager stopUpdatingLocation];
    
}

/**
 *  @brief 当定位发生错误时，会调用代理的此方法。
 *  @param manager 定位 AMapLocationManager 类。
 *  @param error 返回的错误，参考 CLError 。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didFailWithError:(NSError *)error{
    
    [_delegate didFailToLocateUserWithError:error];
    
}

/**
 *  @brief 连续定位回调函数.注意：如果实现了本方法，则定位信息不会通过amapLocationManager:didUpdateLocation:方法回调。
 *  @param manager 定位 AMapLocationManager 类。
 *  @param location 定位结果。
 *  @param reGeocode 逆地理信息。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didUpdateLocation:(CLLocation *)location reGeocode:(AMapLocationReGeocode *)reGeocode{ 
    [_delegate didUpdateUserLocation: [[GaodeMapUserLocation alloc]initWithLocation:location reGeocode:reGeocode]];
}

@end
