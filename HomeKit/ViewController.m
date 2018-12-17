//
//  ViewController.m
//  HomeKit
//
//  Created by 冯俊武 on 2018/10/13.
//  Copyright © 2018年 冯俊武. All rights reserved.
//

#import "ViewController.h"

#import "AWHealthKitManage.h"

@interface ViewController ()

/**
 步数
 */
@property (weak, nonatomic) IBOutlet UILabel *theyCount;

/**
 距离
 */
@property (weak, nonatomic) IBOutlet UILabel *distance;

/**
 时间
 */
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

/**
 活动能量
 */
@property (strong, nonatomic) IBOutlet UILabel *ActivityEnergy;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



/**
 步数获取
 
 @param sender 点击的按钮
 */
- (IBAction)theyCountClick:(UIButton *)sender {
    
    AWHealthKitManage *manage = [AWHealthKitManage shareInstance];
    [manage authorizeHealthKit:^(BOOL success, NSError *error) {
        
        if (success) {
            NSLog(@"success");
            [manage getStepCount:^(double value, NSError *error) {
                NSLog(@"1count-->%.0f", value);
                NSLog(@"1error-->%@", error.localizedDescription);
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.theyCount.text = [NSString stringWithFormat:@"%.0f步", value];
                });
                
            }];
        }
        else {
            NSLog(@"fail");
        }
    }];
    
}

/**
 距离获取
 
 @param sender 点击的按钮
 */
- (IBAction)distanceClick:(UIButton *)sender {
    
    AWHealthKitManage *manage = [AWHealthKitManage shareInstance];
    [manage authorizeHealthKit:^(BOOL success, NSError *error) {
        
        if (success) {
            NSLog(@"success");
            [manage getDistance:^(double value, NSError *error) {
                NSLog(@"2count-->%.2f", value);
                NSLog(@"2error-->%@", error.localizedDescription);
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.distance.text = [NSString stringWithFormat:@"%.2f公里", value];
                });
                
            }];
        }
        else {
            NSLog(@"fail");
        }
    }];
    
}

/**
 运动时间获取
 
 @param sender 点击的按钮
 */
- (IBAction)timeClick:(UIButton *)sender {
    
    AWHealthKitManage *manage = [AWHealthKitManage shareInstance];
    [manage authorizeHealthKit:^(BOOL success, NSError *error) {
        
        if (success) {
            NSLog(@"success");
            [manage getTime:^(double value, NSError *error) {
                
                NSLog(@"2count-->%.2f", value);
                NSLog(@"2error-->%@", error.localizedDescription);
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.timeLabel.text = [NSString stringWithFormat:@"%.0f分钟", value];
                });
                
            }];
        }
        else {
            NSLog(@"fail");
        }
    }];
    
}


/**
 活动能量

 @param sender 点击的按钮
 */
- (IBAction)getEnergyConsumption:(UIButton *)sender {
    
    AWHealthKitManage *manage = [AWHealthKitManage shareInstance];
    
    [manage authorizeHealthKit:^(BOOL success, NSError *error) {
        
        if (success) {
            [manage getActiveEnergy:^(double value, NSError *error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.ActivityEnergy.text = [NSString stringWithFormat:@"%.2f千卡",value];
                });
            }];
        }
        
    }];
}


/**
 添加步数

 @param sender 添加步数按钮
 */
- (IBAction)AddSteps:(UIButton *)sender {
    
    AWHealthKitManage *manage = [AWHealthKitManage shareInstance];
    
    [manage authorizeHealthKit:^(BOOL success, NSError *error) {
        
        if (success) {
            [manage addStepsValue:100 unit:[HKUnit countUnit] state:^(BOOL success, NSError *error) {
                if (success) {
                    NSLog(@"步数添加成功");
                }
            }];
        }
    }];
}


/**
 添加饮水量

 @param sender 按钮
 */
- (IBAction)addWaterQuantity:(UIButton *)sender {
    
    AWHealthKitManage *manage = [AWHealthKitManage shareInstance];
    
    [manage authorizeHealthKit:^(BOOL success, NSError *error) {
        
        if (success) {
            
            [manage addWaterQuantity:0.5 unit:[HKUnit literUnit] state:^(BOOL success, NSError *error) {
                if (success) {
                    NSLog(@"饮水量添加成功");
                }
            }];
        }
    }];
    
}


@end
