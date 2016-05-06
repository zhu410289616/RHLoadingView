//
//  ViewController.m
//  Example
//
//  Created by zhuruhong on 16/5/5.
//  Copyright © 2016年 zhuruhong. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UIView+RHLoading.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    JQIndicatorView *indicator = [[JQIndicatorView alloc] initWithType:JQIndicatorTypeMusic1 tintColor:[self randomColor]];
    indicator.center = CGPointMake(80, 100);
    [self.view addSubview:indicator];
    [indicator startAnimating];
    
    indicator = [[JQIndicatorView alloc] initWithType:JQIndicatorTypeMusic2 tintColor:[self randomColor]];
    indicator.center = CGPointMake(160, 100);
    [self.view addSubview:indicator];
    [indicator startAnimating];
    
    indicator = [[JQIndicatorView alloc] initWithType:JQIndicatorTypeBounceSpot1 tintColor:[self randomColor]];
    indicator.center = CGPointMake(240, 100);
    [self.view addSubview:indicator];
    [indicator startAnimating];
    
    indicator = [[JQIndicatorView alloc] initWithType:JQIndicatorTypeBounceSpot2 tintColor:[self randomColor]];
    indicator.center = CGPointMake(80, 200);
    [self.view addSubview:indicator];
    [indicator startAnimating];
    
    indicator = [[JQIndicatorView alloc] initWithType:JQIndicatorTypeCyclingLine tintColor:[self randomColor]];
    indicator.center = CGPointMake(160, 200);
    [self.view addSubview:indicator];
    [indicator startAnimating];
    
    indicator = [[JQIndicatorView alloc] initWithType:JQIndicatorTypeCyclingCycle tintColor:[self randomColor]];
    indicator.center = CGPointMake(240, 200);
    [self.view addSubview:indicator];
    [indicator startAnimating];
    
    //waiting
    [self.view rh_showLoadingWithWaiting];
    
}

- (UIColor *)randomColor
{
    CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
