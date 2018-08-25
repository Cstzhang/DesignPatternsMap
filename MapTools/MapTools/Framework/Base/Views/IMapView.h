//
//  IMapView.h
//  MapTools
//
//  Created by zhangzb on 2018/7/30.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IUserLocation.h"
typedef enum {
    DMUserTrackingModeNone = 0,             /// 普通定位模式
    DMKUserTrackingModeHeading,              /// 定位方向模式
    DMKUserTrackingModeFollow,               /// 定位跟随模式
    DMKUserTrackingModeFollowWithHeading,    /// 定位罗盘模式
} DMKUserTrackingMode;



//地图视图协议
@protocol IMapView <NSObject>

//返回地图视图
- (UIView *)getView;

//构造函数，指定MapView大小
- (instancetype) initWithFrame:(CGRect)frame;
//显示定位图册
- (void)showUserLocation:(BOOL)isShowUserLocation;
//更新定位图层
- (void)updateLocationData:(id<IUserLocation>)userLocation;

//设置定位模式
-(void)setUserTrackingMode:(DMKUserTrackingMode)mode;

//当mapview即将被显式的时候调用，恢复之前存储的mapview状态
-(void)viewWillAppear;

//当mapview即将被隐藏的时候调用，存储当前mapview的状态。
-(void)viewWillDisappear;

@end
