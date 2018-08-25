//
//  BaiduMapLocationService.m
//  MapTools
//
//  Created by zhangzb on 2018/8/23.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import "BaiduMapLocationService.h"
#import "BaiduMapUserLocation.h"
#import <BaiduMapAPI_Location/BMKLocationService.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
@interface BaiduMapLocationService()<BMKLocationServiceDelegate>

@property (nonatomic)BMKLocationService *locService;

@property (nonatomic) id<ILocationServiceDelegate> delegate;
@end

@implementation BaiduMapLocationService
- (instancetype)init{
    self = [super init];
    if (self) {
        _locService = [[BMKLocationService alloc]init];
    }
    return self;
}
//定义回调协议
- (void)setDelegate:(id<ILocationServiceDelegate>)delegate{
    _delegate = delegate;
    if (delegate == nil) {
        _locService.delegate = nil;
    }else{
        _locService.delegate = self;
    }
    
}

//启动定位
- (void)startUserLocationService{
    
    [_locService startUserLocationService];
    
}

//停止定位
- (void)stopUserLocationService{
    [_locService stopUserLocationService];
}


#pragma mark ——— 实现百度的地图回调
//处理方向信息更新
-(void)didUpdateUserHeading:(BMKUserLocation *)userLocation{
     NSLog(@"回调了我们封装的框架-百度地图-定位-处理方向变更信息");
    [_delegate didUpdateUserHeading:[[BaiduMapUserLocation alloc] initWithUserLocation:userLocation]];
 
}
//处理坐标位置信息更新
-(void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation{
      NSLog(@"回调了我们封装的框架-百度地图-定位-处理位置坐标更新");
    [_delegate didUpdateUserLocation:[[BaiduMapUserLocation alloc] initWithUserLocation:userLocation]];
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error{
    [_delegate didFailToLocateUserWithError:error];
}

@end
