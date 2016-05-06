//
//  RHLoadingView.h
//  Example
//
//  Created by zhuruhong on 16/5/5.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RHLoadingDetailView.h"

extern CGFloat const kLoadingWidth;
extern CGFloat const kLoadingHeight;

@protocol RHLoadingViewDelegate <NSObject>

- (void)didLoadingViewHide;

@end

@interface RHLoadingView : UIView

@property (nonatomic, strong, readonly) RHLoadingDetailView *detailView;
@property (nonatomic, weak) id<RHLoadingViewDelegate> delegate;

- (void)showWithMessage:(NSString *)message duration:(NSTimeInterval)duration type:(JQIndicatorType)type;
- (void)hide:(BOOL)animated;

@end
