//
//  RHLoadingView.h
//  Example
//
//  Created by zhuruhong on 16/5/5.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHLoadingDetailView.h"
#import "RHRandomColorProgressView.h"

extern CGFloat const RHLoadingWidth;
extern CGFloat const RHLoadingHeight;

@protocol RHLoadingViewDelegate <NSObject>

- (void)didLoadingViewHide;

@end

@interface RHLoadingView : UIView

@property (nonatomic, strong, readonly) RHBaseLoadingDetailView *detailView;
@property (nonatomic, weak) id<RHLoadingViewDelegate> delegate;

- (void)showWithType:(JQIndicatorType)type duration:(NSTimeInterval)duration;
- (void)showWithType:(JQIndicatorType)type duration:(NSTimeInterval)duration message:(NSString *)message;
- (void)hide:(BOOL)animated;

@end
