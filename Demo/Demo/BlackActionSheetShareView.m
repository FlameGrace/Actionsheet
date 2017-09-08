//
//  BlackActionSheetShareView.m
//  leapmotor
//
//  Created by Flame Grace on 2017/7/6.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import "BlackActionSheetShareView.h"

@implementation BlackActionSheetShareView

- (void)loadView
{
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    self.titleView.backgroundColor = [UIColor blackColor];
    self.separatorColor = [UIColor whiteColor];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.backGroundView.backgroundColor = [UIColor whiteColor];;
    self.cancelButton.backgroundColor = [UIColor blackColor];
    self.sheetsView.backgroundColor = [UIColor whiteColor];
    [self.cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    for (ActionSheet *sheet in self.sheets) {
        sheet.label.textColor = [UIColor whiteColor];
        sheet.backgroundColor = [UIColor blackColor];
    }
    [super loadView];
}
@end
