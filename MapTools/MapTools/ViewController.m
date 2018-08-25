//
//  ViewController.m
//  Dream_Architect_FactoryMethod_OC_Example
//
//  Created by Dream on 2016/11/23.
//  Copyright © 2016年 Tz. All rights reserved.
//

#import "ViewController.h"
#import "MapEngine.h"
//#import "MapPoiSearchRequest.h"

@interface ViewController ()<ILocationServiceDelegate>

@property (nonatomic) id<IMapView> mapView;
@property (nonatomic) id<IMapFactory> factory;
@property (nonatomic) id<ILocationService> locationService;

@property (strong, nonatomic) IBOutlet UIView *rootView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMapView];
    [self initLocationService];
}

//初始化地图视图
-(void)initMapView{
    //这个框架体现了面向协议编程
    _factory = [[MapEngine sharedInstance] getMapFactory];
    _mapView = [_factory getMapViewWithFrame:CGRectMake(0, 50, self.rootView.frame.size.width, self.rootView.frame.size.height)];
    [self.rootView addSubview:[_mapView getView]];
    
    
}

//初始化定位服务
-(void)initLocationService{
    //初始化定位
    _locationService = [_factory getMapLocationService];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [_mapView viewWillAppear];
    // 此处记得不用的时候需要置nil，否则影响内存的释放
    [_locationService setDelegate:self];
}

-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    [_locationService setDelegate:nil];
    [_locationService stopUserLocationService];
}

//开始定位-使用跟踪模式
-(void)startLocation:(DMKUserTrackingMode)mode{
    //允许显示定位图层
    [_mapView showUserLocation:NO];
    [_mapView setUserTrackingMode:mode];
    [_mapView showUserLocation:YES];
}

//点击事件：触发开始定位
- (IBAction)clickStartLocation:(id)sender {
    //客户端看到的都是API（都是协议,不需要关系具体实现，是不是达到了接触耦合目的）
    //地图定位(你知道是谁吗？客户端使用不需要你是哪一个地图，我知道我要定位)
    [_locationService startUserLocationService];
    //开始正常
    [self startLocation:DMUserTrackingModeNone];
}

//点击事件：触发-使用跟踪
- (IBAction)clickFollow:(id)sender {
    [self startLocation:DMKUserTrackingModeFollow];
}

//实现相关delegate 处理位置信息更新
//处理方向变更信息
- (void)didUpdateUserHeading:(id<IUserLocation>)userLocation{
    NSLog(@"使用客户端收到了定位信息-处理方向变更信息");
}

//处理位置坐标更新
- (void)didUpdateUserLocation:(id<IUserLocation>)userLocation{
    NSLog(@"使用客户端收到了定位信息-处理位置坐标更新");
    //更新图层
    [_mapView updateLocationData:userLocation];
}

//定位失败后，会调用此函数
- (void)didFailToLocateUserWithError:(NSError *)error{
    NSLog(@"客户端-定位失败");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
