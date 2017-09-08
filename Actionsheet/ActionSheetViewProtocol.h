//
//  ActionSheetViewProtocol.h
//  leapmotor
//
//  Created by Flame Grace on 2017/3/20.
//  Copyright © 2017年 Leapmotor. All rights reserved.
//  自定义ActionSheet的视图，用来替代UIAlertController的UIAlertControllerStyleActionSheet形式的视图

#import <Foundation/Foundation.h>
#import "ActionSheet.h"

@protocol  ActionSheetViewProtocol<NSObject>

@optional
@property (nonatomic, strong) NSArray <ActionSheet*>* sheets;
//根据Sheets生成视图
- (id)initWithSheets:(NSArray <ActionSheet *> *)sheets;
//显示
- (void)show;

@end
