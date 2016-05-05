//
//  UIView+RHLoading.h
//  Example
//
//  Created by zhuruhong on 16/5/5.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHLoadingView.h"

@interface UIView (RHLoading) <RHLoadingViewDelegate>

- (RHLoadingView *)rh_loadingView;

- (void)rh_showLoadingWithWaiting;

- (void)rh_showLoadingWithMessage:(NSString *)message;
- (void)rh_showLoadingWithMessage:(NSString *)message duration:(NSTimeInterval)duration;
- (void)rh_hideLoading:(BOOL)animated;

@end
