//
//  BaiduMapFactory.m
//  MapTools
//
//  Created by zhangzb on 2018/7/30.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import "BaiduMapFactory.h"
#import "BaiduMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "BaiduMapLocationService.h"
@interface BaiduMapFactory()
/** 百度地图模拟器 */
@property (nonatomic,strong) BMKMapManager * mapManager;
    
@end

@implementation BaiduMapFactory
//地图AppKey
- (instancetype)initWithAppKey:(NSString *)appKey{
    self = [super init];
    if (self) {//百度
        _mapManager = [[BMKMapManager alloc]init];
        [_mapManager start:appKey generalDelegate:nil];
    }
    return self;
}
    
//生产线
- (id<IMapView>)getMapViewWithFrame:(CGRect)frame{
    return [[BaiduMapView alloc]initWithFrame:frame];
}


// 定位 (定位SDK生产线)
-(id<ILocationService>)getMapLocationService{
    return [[BaiduMapLocationService alloc]init];
}
@end
