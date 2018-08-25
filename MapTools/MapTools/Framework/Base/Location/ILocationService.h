//
//  ILocation.h
//  MapTools
//
//  Created by zhangzb on 2018/8/22.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILocationServiceDelegate.h"
//定位协议
@protocol ILocationService <NSObject>
//启动定位
- (void)startUserLocationService;
//定义回调协议
- (void)setDelegate:(id<ILocationServiceDelegate>)delegate;
//停止定位
- (void)stopUserLocationService;

@end
