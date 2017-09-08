//
//  ActionSheetAlertView.m
//  leapmotor
//
//  Created by Flame Grace on 2017/3/20.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import "ActionSheetAlertView.h"

#define ACTIONSHEET_BACKGROUNDCOLOR             [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1]
#define WINDOW_COLOR                            [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]
#define ANIMATE_DURATION                        0.25f


@interface ActionSheetAlertView()

@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;

@end

@implementation ActionSheetAlertView

@synthesize sheets = _sheets;
@synthesize backGroundView = _backGroundView;
@synthesize cancelButton = _cancelButton;
@synthesize sheetsView = _sheetsView;


- (id)initWithSheets:(NSArray<ActionSheet *> *)sheets
{
    if(self = [super init])
    {
        self.sheets = sheets;
        self.separatorColor = [UIColor blackColor];
        [self loadView];
    }
    
    return self;
}


- (void)sheetClicked:(ActionSheet*)sheet
{
    [self tappedCancel];
    sheet.clickCallback(sheet.tag);
    
    
}


- (void)tappedCancel
{
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        [self.backGroundView setFrame:CGRectMake(0, MainScreen.size.height, MainScreen.size.width, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

- (void)show
{
    ActionSheetAlertView *view = [[UIApplication sharedApplication].keyWindow viewWithTag:ActionSheetAlertViewTag];
    if(view&&[view isKindOfClass:[self class]])
    {
        [view tappedCancel];
        return;
    }
    self.tag = ActionSheetAlertViewTag;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:ANIMATE_DURATION animations:^{
        CGRect frame = self.backGroundView.frame;
        frame.origin.y = MainScreen.size.height - frame.size.height;
        self.backGroundView.frame = frame;
    }];
}


- (void)loadView
{
    [self.cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    self.frame = MainScreen;
    self.backgroundColor = WINDOW_COLOR;
    self.userInteractionEnabled = YES;
    [self tapGesture];
    
    [self loadSheetsView];
    
    self.cancelButton.frame = CGRectMake(0, self.sheetsView.frame.size.height + 4, MainScreen.size.width, 52);
    self.backGroundView.frame = CGRectMake(0, MainScreen.size.height, MainScreen.size.width , self.sheetsView.frame.size.height + 56);
}


- (void)loadSheetsView
{
    [self.sheetsView removeFromSuperview];
    self.sheetsView = nil;
    
    CGFloat buttonHeight = 52;
    
    NSInteger line = self.sheets.count;
    for (NSInteger i = 0; i<line; i++)
    {
        ActionSheet *button = self.sheets[i];
        CGFloat y = i*buttonHeight;
        button.frame = CGRectMake(0, y, self.frame.size.width, buttonHeight);
        [self setActionSheetStyle:button];
        //添加底部的border
        CALayer *bottomBorder = [CALayer layer];
        bottomBorder.frame = CGRectMake(0.0f, button.frame.size.height-0.5, button.frame.size.width, 0.5);
        bottomBorder.backgroundColor = self.separatorColor.CGColor;
        [button.layer addSublayer:bottomBorder];
        [self.sheetsView addSubview:button];
    }
    
    CGFloat sheetsHeight = line*buttonHeight;
    self.sheetsView.frame = CGRectMake(0, 0, self.frame.size.width, sheetsHeight);
    
}

- (void)setActionSheetStyle:(ActionSheet *)actionSheet
{
    actionSheet.label.frame = CGRectMake(0, 0, actionSheet.frame.size.width, actionSheet.frame.size.height);
    actionSheet.label.textAlignment = NSTextAlignmentCenter;
    actionSheet.label.font = [UIFont systemFontOfSize:18.0];
    actionSheet.label.text = actionSheet.title;
    [actionSheet addTarget:self action:@selector(sheetClicked:) forControlEvents:UIControlEventTouchUpInside];
}


- (UIView *)backGroundView
{
    if(!_backGroundView)
    {
        _backGroundView = [[UIView alloc]init];
        _backGroundView.backgroundColor = [UIColor blackColor];
        _backGroundView.layer.borderColor = self.separatorColor.CGColor;
        _backGroundView.layer.borderWidth = 0.5;
        [self addSubview:_backGroundView];
    }
    return _backGroundView;
}


- (UIView *)sheetsView
{
    if(!_sheetsView)
    {
        _sheetsView = [[UIView alloc]init];
        _sheetsView.backgroundColor = [UIColor whiteColor];
        _sheetsView.alpha = 0.8;
        [self.backGroundView addSubview:_sheetsView];
    }
    return _sheetsView;
}

- (UIButton *)cancelButton
{
    if(!_cancelButton)
    {
        _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelButton.backgroundColor = [UIColor whiteColor];
        _cancelButton.alpha = 0.8;
        [_cancelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(tappedCancel) forControlEvents:UIControlEventTouchUpInside];
        [self.backGroundView addSubview:_cancelButton];
    }
    return _cancelButton;
}

- (UITapGestureRecognizer *)tapGesture
{
    if(!_tapGesture)
    {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
        [self addGestureRecognizer:_tapGesture];
    }
    return _tapGesture;
}


@end
