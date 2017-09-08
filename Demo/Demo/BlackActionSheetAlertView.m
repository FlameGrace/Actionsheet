//
//  BlackActionSheetAlertView.m
//  leapmotor
//
//  Created by Flame Grace on 2017/7/6.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import "BlackActionSheetAlertView.h"

@implementation BlackActionSheetAlertView

- (void)loadView
{
    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    self.separatorColor = [UIColor whiteColor];
    self.backGroundView.backgroundColor = [UIColor whiteColor];
    self.cancelButton.backgroundColor = [UIColor blackColor];
    self.sheetsView.backgroundColor = [UIColor blackColor];
    [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    for (ActionSheet *sheet in self.sheets) {
        sheet.label.textColor = [UIColor whiteColor];
        sheet.backgroundColor = [UIColor colorWithRed:26/255.0 green:26/255.0 blue:26/255.0 alpha:1];
    }
    [super loadView];
    
}


@end
