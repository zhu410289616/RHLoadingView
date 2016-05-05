//
//  RHLoadingView.h
//  Example
//
//  Created by zhuruhong on 16/5/5.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JQIndicatorView.h"

@protocol RHLoadingViewDelegate <NSObject>

- (void)didLoadingViewHide;

@end

@interface RHLoadingView : UIView

@property (nonatomic, strong, readonly) JQIndicatorView *indicatorView;
@property (nonatomic, strong, readonly) UILabel *textLabel;
@property (nonatomic, weak) id<RHLoadingViewDelegate> delegate;

- (instancetype)initWithIndicatorType:(JQIndicatorType)type;
- (instancetype)initWithIndicatorType:(JQIndicatorType)type tintColor:(UIColor *)color;
- (instancetype)initWithIndicatorType:(JQIndicatorType)type tintColor:(UIColor *)color size:(CGSize)size;

- (void)showWithMessage:(NSString *)message duration:(NSTimeInterval)duration;
- (void)hide:(BOOL)animated;

@end
