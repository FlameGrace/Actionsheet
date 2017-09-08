//
//  ActionSheetAlertView_Title.h
//  leapmotor
//
//  Created by Flame Grace on 2017/7/4.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import "ActionSheetAlertView.h"

@interface ActionSheetAlertView_Title : ActionSheetAlertView

@property (assign, nonatomic) BOOL showTitle;

@property (strong, nonatomic) UIView *titleView;

@property (strong, nonatomic) UILabel *titleLabel;

@end
