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

#import "RHRandomColorProgressView.h"

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
    
    //
    NSArray *colors = @[
                        [UIColor purpleColor],
                        [UIColor orangeColor],
                        [UIColor cyanColor],
                        [UIColor redColor],
                        [UIColor greenColor],
                        [UIColor blueColor],
                        [UIColor yellowColor]
                        ];
    RHRandomColorProgressView *progressView = [[RHRandomColorProgressView alloc] initWithFrame:CGRectMake(0, 0, 80, 80) andLineWidth:3.0 andLineColor:colors];
    progressView.center = self.view.center;
    [self.view addSubview:progressView];
    
    //waiting
//    [self.view rh_showWaitingWithMusic2];
//    [self.view rh_showWaitingWithCyclingCycle];
//    [self.view rh_showLoadingWithType:JQIndicatorTypeCyclingLine duration:5 message:@"sdfsd304t是对方是开放的精神"];
    [self.view rh_showWaitingWithBounceSpot2];
    
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
