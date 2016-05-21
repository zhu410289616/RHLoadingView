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

/** indicator */
@property (nonatomic, strong, readonly) JQIndicatorView *indicatorView;

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, assign) JQIndicatorType indicatorType;
@property (nonatomic, assign) CGSize indicatorSize;

- (void)show;

/** message */
@property (nonatomic, strong, readonly) UILabel *textLabel;
@property (nonatomic, strong) UIFont *textFont;

- (void)showWithMessage:(NSString *)message;

@end
