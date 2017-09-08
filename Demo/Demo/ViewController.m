//
//  ViewController.m
//  Demo
//
//  Created by Flame Grace on 2017/9/7.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import "ViewController.h"
#import "BlackActionSheetAlertView.h"
#import "BlackActionSheetShareView.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [self button:@"alert"];
    btn.frame = CGRectMake(34, 100, 100, 44);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(alert) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [self button:@"share"];
    btn2.frame = CGRectMake(34, 300, 100, 44);
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];

}

- (void)alert
{
    
    ActionSheet *confirm = [ActionSheet sheetWithTitle:@"确认" image:nil clickCallback:^(NSInteger tag) {
       
        ActionSheet *delete = [ActionSheet sheetWithTitle:@"清空纪录" image:nil clickCallback:^(NSInteger tag) {
        }];
        BlackActionSheetAlertView *alert2 = [[BlackActionSheetAlertView alloc]initWithSheets:@[delete]];
        delete.label.textColor = [UIColor redColor];
        [alert2 show];
    }];
    ActionSheetAlertView *alert = [[ActionSheetAlertView alloc]initWithSheets:@[confirm]];
    confirm.label.textColor = [UIColor blueColor];
    [alert show];
    
    
}

- (void)share
{
    ActionSheet *qq = [ActionSheet sheetWithTitle:@"QQ好友" image:[UIImage imageNamed:@"qq"] clickCallback:^(NSInteger tag) {
    }];
    ActionSheet *weixin = [ActionSheet sheetWithTitle:@"微信好友" image:[UIImage imageNamed:@"weixin"] clickCallback:^(NSInteger tag) {
    }];
    ActionSheet *sina = [ActionSheet sheetWithTitle:@"新浪微博" image:[UIImage imageNamed:@"sina"] clickCallback:^(NSInteger tag) {
    }];
//    ActionSheetShareView *alert = [[ActionSheetShareView alloc]initWithSheets:@[qq,weixin,sina] arrangeType:ActionSheetArrangeThree];
//    [alert show];
    
    BlackActionSheetShareView *alert = [[BlackActionSheetShareView alloc]initWithSheets:@[qq,weixin,sina] arrangeType:ActionSheetArrangeThree];
    [alert show];
}


- (UIButton *)button:(NSString *)title
{
    UIButton *label = [[UIButton alloc]init];
    label.backgroundColor = [UIColor whiteColor];
    [label setTitle:title forState:UIControlStateNormal];
    [label setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    return label;
}


@end
