//
//  ActionSheet.m
//  Created by Flame Grace on 14-12-24.
//  Copyright (c) 2014年 com.flamegrace. All rights reserved.
//

#import "ActionSheet.h"

#define TitleTextFontSize 12.0

@implementation ActionSheet





+ (instancetype)sheetWithTitle:(NSString *)title image:(UIImage *)image clickCallback:(ActionShareSheetClickCallback)clickCallback
{
    ActionSheet *sheet = [[ActionSheet alloc]init];
    sheet.image = image;
    sheet.title = title;
    sheet.clickCallback = clickCallback;

    return sheet;
}

- (UIImageView *)picView
{
    if(!_picView)
    {
        _picView = [[UIImageView alloc]init];
        [self addSubview:_picView];
    }
    return _picView;
}

- (UILabel *)label
{
    if(!_label)
    {
        _label = [[UILabel alloc]init];
        [self addSubview:_label];
    }
    return _label;
}


@end







