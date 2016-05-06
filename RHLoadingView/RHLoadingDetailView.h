//
//  RHLoadingDetailView.h
//  Example
//
//  Created by zhuruhong on 16/5/6.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JQIndicatorView.h"

@interface RHLoadingDetailView : UIView

@property (nonatomic, strong, readonly) JQIndicatorView *indicatorView;
@property (nonatomic, strong, readonly) UILabel *textLabel;

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, assign) JQIndicatorType indicatorType;
@property (nonatomic, assign) CGSize indicatorSize;
@property (nonatomic, strong) UIFont *textFont;

- (void)showWithMessage:(NSString *)message duration:(NSTimeInterval)duration;

@end
