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

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, assign) JQIndicatorType indicatorType;
@property (nonatomic, assign) CGSize indicatorSize;
@property (nonatomic, strong) UIFont *textFont;

@property (nonatomic, weak) id<RHLoadingViewDelegate> delegate;

- (void)showWithMessage:(NSString *)message duration:(NSTimeInterval)duration;
- (void)hide:(BOOL)animated;

@end
