//
//  IMapFactory.h
//  MapTools
//
//  Created by zhangzb on 2018/7/30.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMapView.h"
#import "ILocationService.h"
@protocol IMapFactory <NSObject>
//地图AppKey
- (instancetype)initWithAppKey:(NSString *)appKey;
    
// 视图（视图生产线）
- (id<IMapView>)getMapViewWithFrame:(CGRect)frame;

// 定位 (定位SDK生产线)
-(id<ILocationService>)getMapLocationService;
// 导航 (导航SDK生产线)

@end
