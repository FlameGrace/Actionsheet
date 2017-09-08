//
//  ActionSheetShareView2.h
//  leapmotor
//
//  Created by Flame Grace on 2017/3/28.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import "ActionSheetAlertView_Title.h"

typedef NS_ENUM(NSInteger, ActionSheetArrangeType)
{
    ActionSheetArrangeThree = 3,
    ActionSheetArrangeFour,
};

@interface ActionSheetShareView : ActionSheetAlertView_Title

- (id)initWithSheets:(NSArray <ActionSheet *> *)sheets arrangeType:(ActionSheetArrangeType)arrange;

@end
