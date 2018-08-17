//
//  IMapFactory.h
//  MapTools
//
//  Created by zhangzb on 2018/7/30.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMapView.h"
@protocol IMapFactory <NSObject>
//地图AppKey
- (instancetype)initWithAppKey:(NSString *)appKey;
    
//生产线
- (id<IMapView>)getMapViewWithFrame:(CGRect)frame;

@end
