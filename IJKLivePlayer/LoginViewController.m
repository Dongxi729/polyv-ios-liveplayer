//
//  ViewController.m
//  PolyvIJKLivePlayer
//
//  Created by ftao on 2016/12/8.
//  Copyright © 2016年 easefun. All rights reserved.
//

#import "LoginViewController.h"
#import "LivePlayerViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <PLVLiveAPI/PLVSettings.h>
#import "PLVLiveManager.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userIdTF;
@property (weak, nonatomic) IBOutlet UITextField *channelIdTF;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    if (userInfo) {
        self.userIdTF.text = userInfo[0];
        self.channelIdTF.text = userInfo[1];
    }
}

- (IBAction)loginButtonClick:(UIButton *)sender {
    // 保存数据
    [[NSUserDefaults standardUserDefaults] setObject:@[self.userIdTF.text,self.channelIdTF.text] forKey:@"userInfo"];
    if (![self.userIdTF.text length] || ![self.channelIdTF.text length]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"用户名和账号不能为空" preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = @"登录中...";
    
    NSString *userId = self.userIdTF.text;
    NSString *channelId = self.channelIdTF.text;
    
    // 请求拉流地址
    [PLVChannel loadVideoJsonWithUserId:userId channelId:channelId completionHandler:^(PLVChannel *channel) {
        [hud hideAnimated:YES];
        [[PLVLiveManager sharedLiveManager] setupChannelId:channelId userId:userId];
        
        LivePlayerViewController *livePlayerVC = [LivePlayerViewController new];
        livePlayerVC.channel = channel;
        [self presentViewController:livePlayerVC animated:YES completion:nil];
    } failureHandler:^(NSString *errorName, NSString *errorDescription) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:errorName message:errorDescription preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }];
}

#pragma mark - view controller

// 点击view结束编辑
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

// 禁止当前控制器转屏
- (BOOL)shouldAutorotate {
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end