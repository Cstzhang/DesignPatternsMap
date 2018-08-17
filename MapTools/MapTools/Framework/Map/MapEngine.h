//
//  MapEngine.h
//  MapTools
//
//  Created by zhangzb on 2018/8/2.
//  Copyright © 2018年 zhangzb. All rights reserved.
//
//地图引擎：用于动态穿件具体的地图工厂
#import <Foundation/Foundation.h>
#import "IMapFactory.h"
@interface MapEngine : NSObject
//单例模式
+ (instancetype)sharedInstance;

//初始化引擎对应的地图SDK
- (void)initMap;

//创建工厂

- (id<IMapFactory>)getMapFactory;


@end
