//
//  GaodeMapFactory.m
//  MapTools
//
//  Created by zhangzb on 2018/8/17.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import "GaodeMapFactory.h"
#import "GaodeMapView.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "GaodeMapLocationService.h"
@interface GaodeMapFactory()


@end

@implementation GaodeMapFactory
//地图AppKey
- (instancetype)initWithAppKey:(NSString *)appKey{
    self = [super init];
    if (self) {//高德
        [AMapServices sharedServices].apiKey = appKey;

    }
    return self;
}

//生产线
- (id<IMapView>)getMapViewWithFrame:(CGRect)frame{
    return [[GaodeMapView alloc]initWithFrame:frame];
}

// 定位 (定位SDK生产线)
-(id<ILocationService>)getMapLocationService{
    return [[GaodeMapLocationService alloc]init];
}


@end
