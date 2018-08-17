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
@end
