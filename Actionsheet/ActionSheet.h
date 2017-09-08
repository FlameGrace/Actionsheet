//
//  ActionSheet.h
//  Copyright (c) 2014年 com.flamegrace. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ActionShareSheetClickCallback)(NSInteger tag);

@interface ActionSheet : UIButton

@property (strong, nonatomic) UIImageView *picView;

@property (strong, nonatomic) UILabel *label;

@property (strong, nonatomic) UIImage *image;

@property (strong, nonatomic) NSString *title;

@property (strong, nonatomic) ActionShareSheetClickCallback clickCallback;

+ (instancetype)sheetWithTitle:(NSString *)title image:(UIImage *)image clickCallback:(ActionShareSheetClickCallback)clickCallback;

@end
