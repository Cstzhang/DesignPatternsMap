//
//  IMapView.h
//  MapTools
//
//  Created by zhangzb on 2018/7/30.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IMapView <NSObject>

//返回地图视图
- (UIView *)getView;

//构造函数，指定MapView大小
- (instancetype) initWithFrame:(CGRect)frame;

@end
