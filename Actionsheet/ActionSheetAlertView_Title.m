//
//  ActionSheetAlertView_Title.m
//  leapmotor
//
//  Created by Flame Grace on 2017/7/4.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import "ActionSheetAlertView_Title.h"

@implementation ActionSheetAlertView_Title


- (void)setShowTitle:(BOOL)showTitle
{
    _showTitle = showTitle;
    self.titleView.hidden = !showTitle;
    [self updateTitleView];
}

- (void)updateTitleView
{
    if(self.showTitle)
    {
        CGRect backGroundFrame = self.backGroundView.frame;
        backGroundFrame.origin.y-= 44;
        backGroundFrame.size.height += 44;
        self.backGroundView.frame = backGroundFrame;
        
        CGRect sheetsFrame = self.sheetsView.frame;
        sheetsFrame.origin.y+= 44;
        self.sheetsView.frame = sheetsFrame;
        
        CGRect cancelFrame = self.cancelButton.frame;
        cancelFrame.origin.y+= 44;
        self.cancelButton.frame = cancelFrame;
    }
    self.titleView.hidden = !self.showTitle;
}

- (void)loadView
{
    [super loadView];
    self.titleView.frame = CGRectMake(0, 0, self.frame.size.width, 44);
    self.titleLabel.frame = CGRectMake(0, 13, self.frame.size.width, 18);
    [self updateTitleView];
}


- (UILabel *)titleLabel
{
    if(!_titleLabel)
    {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.titleView addSubview:_titleLabel];
    }
    return _titleLabel;
}


- (UIView *)titleView
{
    if(!_titleView)
    {
        _titleView = [[UIView alloc]init];
        _titleView.backgroundColor = [UIColor whiteColor];
        _titleView.alpha = 0.8;
        [self.backGroundView addSubview:_titleView];
    }
    return _titleView;
}

@end
