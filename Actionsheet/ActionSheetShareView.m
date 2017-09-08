//
//  ActionSheetShareView2.m
//  leapmotor
//
//  Created by Flame Grace on 2017/3/28.
//  Copyright © 2017年 com.flamegrace. All rights reserved.
//

#import "ActionSheetShareView.h"

@interface ActionSheetShareView()

//列说，默认4列
@property (assign, nonatomic) ActionSheetArrangeType arrange;

@end

@implementation ActionSheetShareView


- (instancetype)init
{
    if(self = [super init])
    {
        self.backgroundColor =  [UIColor blackColor];
        self.arrange = ActionSheetArrangeFour;
        self.separatorColor = [UIColor blackColor];
        [self loadView];
    }
    return self;
}


- (id)initWithSheets:(NSArray <ActionSheet *> *)sheets arrangeType:(ActionSheetArrangeType)arrange
{
    if(self = [super init])
    {
        self.sheets = sheets;
        self.arrange = arrange;
        self.backgroundColor =  [UIColor blackColor];
        self.separatorColor = [UIColor blackColor];;
        [self loadView];
    }
    return self;
}



- (void)loadSheetsView
{
    
    CGFloat remainWidth = MainScreen.size.width;
    CGFloat buttonWidth = remainWidth/self.arrange;
    CGSize sheetSize = CGSizeMake(buttonWidth, buttonWidth);
    NSInteger lineSum = floor(self.sheets.count/self.arrange);
    
    
    for (NSInteger i = 0; i<self.sheets.count; i++)
    {
        ActionSheet *button = self.sheets[i];
        
        NSInteger line = floor(i/self.arrange);
        NSInteger arrange = i%self.arrange;
        CGFloat x = arrange*sheetSize.width;
        CGFloat y = line*sheetSize.height;
        
        CGRect frame = CGRectMake(x, y, sheetSize.width, sheetSize.height);
        button.frame = frame;
        
        [self setActionSheetStyle:button];
        
        if(line != lineSum)
        {
            //添加底部的border
            CALayer *bottomBorder = [CALayer layer];
            bottomBorder.frame = CGRectMake(0.0f, frame.size.height-0.5, frame.size.width, 0.5);
            bottomBorder.backgroundColor = self.separatorColor.CGColor;
            [button.layer addSublayer:bottomBorder];
        }
        if(arrange != self.arrange)
        {
            //添加右边的border
            CALayer *rightBorder = [CALayer layer];
            rightBorder.frame = CGRectMake(frame.size.width-0.5, 0, 0.5, frame.size.height);
            rightBorder.backgroundColor = self.separatorColor.CGColor;
            [button.layer addSublayer:rightBorder];
        }
        
        [self.sheetsView addSubview:button];
    }
    
    NSInteger line = ceilf((CGFloat)self.sheets.count/(CGFloat)self.arrange);
    CGFloat sheetsHeight = line*sheetSize.height;
    self.sheetsView.frame = CGRectMake(0, 0, MainScreen.size.width, sheetsHeight);
    
}

- (void)setActionSheetStyle:(ActionSheet *)actionSheet
{
    CGFloat width = actionSheet.frame.size.width;
    CGFloat height = actionSheet.frame.size.width;
    CGFloat x = (width - 36)/2;
    CGFloat y = (height - 36 - 4 - 12)/2;
    actionSheet.picView.frame = CGRectMake(x, y, 36, 36);
    actionSheet.label.frame = CGRectMake(0, y + 36 + 4, width, 12.0);
    actionSheet.label.textAlignment = NSTextAlignmentCenter;
    actionSheet.label.font = [UIFont systemFontOfSize:12.0];
    actionSheet.label.text = actionSheet.title;
    actionSheet.picView.image = actionSheet.image;
    [actionSheet addTarget:self action:@selector(sheetClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}


@end
