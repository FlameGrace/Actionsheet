//
//  ActionSheetAlertView.h
//
//  Created by Flame Grace on 2017/3/20.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//  自定义的AlerView的视图，用来替代UIAlertController的UIAlertControllerStyleAlert形式的视图

#import <UIKit/UIKit.h>
#import "ActionSheetViewProtocol.h"
#define MainScreen ([UIScreen mainScreen].bounds)


#define ActionSheetAlertViewTag (NSInteger)(201703200111)

@interface ActionSheetAlertView : UIView <ActionSheetViewProtocol>

@property (strong, nonatomic) UIColor *separatorColor;
//背景视图
@property (strong, nonatomic) UIView *backGroundView;
//存放sheet的视图
@property (strong, nonatomic) UIView *sheetsView;
//取消按钮视图
@property (strong, nonatomic) UIButton *cancelButton;

//加载sheetsView
- (void)loadSheetsView;
//加载全部View
- (void)loadView;
//sheet被点击
- (void)sheetClicked:(ActionSheet*)sheet;

@end
