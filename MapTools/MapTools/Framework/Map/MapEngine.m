//
//  MapEngine.m
//  MapTools
//
//  Created by zhangzb on 2018/8/2.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import "MapEngine.h"
#import "PlatformXmlParser.h"
#import "Platfrom.h"
@interface MapEngine()
@property (nonatomic) NSMutableArray *array;
@end

@implementation MapEngine

static MapEngine *instance = nil;
//单例模式
+ (instancetype)sharedInstance{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[MapEngine alloc]init];
    });
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    if (instance == nil) {
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            instance = [super allocWithZone:zone];
        });
    }
    return instance;
}



//初始化引擎对应的地图SDK
- (void)initMap{
    //初始化
    PlatformXmlParser *xmlParser = [[PlatformXmlParser alloc]init];
    _array = [xmlParser parser];
}

//创建工厂

- (id<IMapFactory>)getMapFactory{
    @try{
        //循环遍历要创建的工厂
        for (Platfrom *platform in _array) {
            if ([platform.isOpen isEqualToString:@"YES"] ) {
                return [[NSClassFromString(platform.factoryName) alloc] initWithAppKey:platform.appkey];
            }
        }
    }@catch(NSException *exception){
        NSLog(@"创建工厂出错，请检查配置xml文件：%@",exception);
    }
    
    return nil;
}

@end
