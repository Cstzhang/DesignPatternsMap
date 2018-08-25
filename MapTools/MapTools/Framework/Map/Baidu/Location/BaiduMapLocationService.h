//
//  BaiduMapLocationService.h
//  MapTools
//
//  Created by zhangzb on 2018/8/23.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILocationService.h"

@interface BaiduMapLocationService : NSObject<ILocationService>
//启动定位
- (void)startUserLocationService;
@end
