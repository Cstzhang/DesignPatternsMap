//
//  BaiduMapView.m
//  MapTools
//
//  Created by zhangzb on 2018/7/30.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import "BaiduMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface BaiduMapView()
/** 百度地图模拟器 */
@property (nonatomic,strong) BMKMapView * mapView;

@end

@implementation BaiduMapView

//构造函数，指定MapView大小
- (instancetype) initWithFrame:(CGRect)frame{
    self = [super init];
    if (self) {
        _mapView = [[BMKMapView alloc] initWithFrame:frame];
    }
    return self;
}

- (UIView *)getView{
    return _mapView;
}

- (void)updateLocationData:(id<IUserLocation>)userLocation{
    [_mapView updateLocationData:[userLocation getObject]];
    
}

- (void)showUserLocation:(BOOL)isShowUserLocation{
   
    _mapView.showsUserLocation = isShowUserLocation;
}

//设置地图定位模式
-(void)setUserTrackingMode:(DMKUserTrackingMode)mode{
    switch (mode) {
        case DMUserTrackingModeNone:
            _mapView.userTrackingMode = BMKUserTrackingModeNone;
            break;
        case DMKUserTrackingModeFollow:
            _mapView.userTrackingMode = BMKUserTrackingModeFollow;
            break;
        case DMKUserTrackingModeHeading:
            _mapView.userTrackingMode = BMKUserTrackingModeHeading;
            break;
        case DMKUserTrackingModeFollowWithHeading:
            _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
            break;
        default:
            break;
    }
}

//当mapview即将被显式的时候调用，恢复之前存储的mapview状态
-(void)viewWillAppear{
    [_mapView viewWillAppear];
}

//当mapview即将被隐藏的时候调用，存储当前mapview的状态。
-(void)viewWillDisappear{
    [_mapView viewWillDisappear];
}

@end
