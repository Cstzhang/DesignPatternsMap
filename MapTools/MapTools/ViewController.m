//
//  ViewController.m
//  MapTools
//
//  Created by zhangzb on 2018/7/30.
//  Copyright © 2018年 zhangzb. All rights reserved.
//

#import "ViewController.h"
#import "MapEngine.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   id<IMapFactory> factory = [[MapEngine sharedInstance]getMapFactory];
    id<IMapView> mapView = [factory getMapViewWithFrame:self.view.frame];
    [self.view addSubview:mapView.getView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
