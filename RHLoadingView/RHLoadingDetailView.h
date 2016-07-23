//
//  RHLoadingDetailView.h
//  Example
//
//  Created by zhuruhong on 16/5/6.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import "RHBaseLoadingDetailView.h"
#import "JQIndicatorView.h"

@interface RHLoadingDetailView : RHBaseLoadingDetailView

/** indicator */
@property (nonatomic, strong, readonly) JQIndicatorView *indicatorView;

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, assign) JQIndicatorType indicatorType;
@property (nonatomic, assign) CGSize indicatorSize;

/** message */
@property (nonatomic, strong, readonly) UILabel *textLabel;
@property (nonatomic, strong) UIFont *textFont;

@end
