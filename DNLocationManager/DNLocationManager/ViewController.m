//
//  ViewController.m
//  DNLocationManager
//
//  Created by mainone on 16/4/20.
//  Copyright © 2016年 wjn. All rights reserved.
//

#import "ViewController.h"
#import "DNLocationManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self getLocation];
//    [self getAddress];
//    [self getLocationAndAddress];
    [self getCity];
}

//获取坐标
- (void)getLocation {
    [[DNLocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        NSLog(@"经度:%f  纬度:%f",locationCorrrdinate.latitude, locationCorrrdinate.longitude);
    } failure:^(NSError *error) {
        NSLog(@"获取坐标失败:%@",error);
    }];
}

//获取地址
- (void)getAddress {
    [[DNLocationManager shareLocation] getAddress:^(NSString *addressString) {
        NSLog(@"获取到的地址:%@",addressString);
    } failure:^(NSError *error) {
        NSLog(@"获取地址失败:%@",error);
    }];
}

//获取坐标和地址
- (void)getLocationAndAddress {
    [[DNLocationManager shareLocation] getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
        NSLog(@"经度:%f  纬度:%f",locationCorrrdinate.latitude, locationCorrrdinate.longitude);
    } withAddress:^(NSString *addressString) {
        NSLog(@"获取到的地址:%@",addressString);
    } failure:^(NSError *error) {
        NSLog(@"获取坐标失败:%@",error);
    } addressFailure:^(NSError *error) {
        NSLog(@"获取地址失败:%@",error);
    }];
}

//获取城市
- (void)getCity {
    [[DNLocationManager shareLocation] getCity:^(NSString *cityString) {
        NSLog(@"城市名称:%@",cityString);
    } failure:^(NSError *error) {
        NSLog(@"获取城市失败:%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
