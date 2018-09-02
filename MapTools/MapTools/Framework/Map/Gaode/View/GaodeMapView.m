//
//  GaodeMapView.m
//  
//
//  Created by zhangzb on 2018/8/17.
//

#import "GaodeMapView.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>
@interface GaodeMapView()
/** 百度地图模拟器 */
@property (nonatomic,strong) MAMapView * mapView;
@property (nonatomic)MAPointAnnotation *pointAnnotation;
@end

@implementation GaodeMapView

//构造函数，指定MapView大小
- (instancetype) initWithFrame:(CGRect)frame{
    self = [super init];
    if (self) {
        _mapView = [[MAMapView alloc] initWithFrame:frame];
    }
    return self;
}

- (UIView *)getView{
    return _mapView;
}
- (void)updateLocationData:(id<IUserLocation>)userLocation{
//    [_mapView updateLocationData:[userLocation getObject]];
    if (self.pointAnnotation == nil) {
        _pointAnnotation = [[MAPointAnnotation alloc]init];
        [_pointAnnotation setCoordinate:[userLocation getLocation].coordinate];
        [_mapView addAnnotation:_pointAnnotation];
    }
    [_pointAnnotation setCoordinate:[userLocation getLocation].coordinate];
    [self.mapView setCenterCoordinate:[userLocation getLocation].coordinate];
    [self.mapView setZoomLevel:10];
    
}

- (void)showUserLocation:(BOOL)isShowUserLocation{
    
   // _mapView.showsUserLocation = isShowUserLocation;
}

//设置地图定位模式
-(void)setUserTrackingMode:(DMKUserTrackingMode)mode{
//    switch (mode) {
//        case DMUserTrackingModeNone:
//            _mapView.userTrackingMode = BMKUserTrackingModeNone;
//            break;
//        case DMKUserTrackingModeFollow:
//            _mapView.userTrackingMode = BMKUserTrackingModeFollow;
//            break;
//        case DMKUserTrackingModeHeading:
//            _mapView.userTrackingMode = BMKUserTrackingModeHeading;
//            break;
//        case DMKUserTrackingModeFollowWithHeading:
//            _mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading;
//            break;
//        default:
//            break;
//    }
}

//当mapview即将被显式的时候调用，恢复之前存储的mapview状态
-(void)viewWillAppear{
//    [_mapView viewWillAppear];
}

//当mapview即将被隐藏的时候调用，存储当前mapview的状态。
-(void)viewWillDisappear{
//    [_mapView viewWillDisappear];
}


@end
