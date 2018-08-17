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

@end
