//
//  ILocationServiceDelegate.h
//  MapTools
//
//  Created by zhangzb on 2018/8/22.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IUserLocation.h"
//定位回调协议
@protocol ILocationServiceDelegate <NSObject>
//处理方向信息更新
- (void)didUpdateUserHeading:(id<IUserLocation>)userLocation;
//处理坐标位置信息更新
- (void)didUpdateUserLocation:(id<IUserLocation>)userLocation;
/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error;

@end
