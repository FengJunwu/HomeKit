//
//  AWHealthKitManage.h
//  ios健康获取
//
//  Created by iMac-1 on 2018/3/22.
//  Copyright © 2018年 iOS_阿玮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HealthKit/HealthKit.h>
#import <UIKit/UIDevice.h>
#define HKVersion [[[UIDevice currentDevice] systemVersion] doubleValue]
#define CustomHealthErrorDomain @"com.sdqt.healthError"

@interface AWHealthKitManage : NSObject

@property (nonatomic, strong) HKHealthStore *healthStore;

/**
 创建单例对象~

 @return self
 */
+(instancetype)shareInstance;
/*
 *  @brief  检查是否支持获取健康数据
 */
- (void)authorizeHealthKit:(void(^)(BOOL success, NSError *error))compltion;

//获取步数
- (void)getStepCount:(void(^)(double value, NSError *error))completion;

//获取公里数
- (void)getDistance:(void(^)(double value, NSError *error))completion;

//获取运动时间
- (void)getTime:(void(^)(double value, NSError *error))completion;

//活动能量 千卡
-(void)getActiveEnergy:(void(^)(double value, NSError *error))completion;




/**
 添加运动步数

 @param value 步数
 @param unit 单位
 @param completion 错误码
 */
-(void)addStepsValue:(double)value unit:(HKUnit *)unit state:(void(^)(BOOL success, NSError *error))completion;


/**
 添加饮水量

 @param value 水量
 @param unit 单位
 @param completion 状态码
 */
-(void)addWaterQuantity:(double)value unit:(HKUnit *)unit state:(void(^)(BOOL success, NSError *error))completion;

@end
