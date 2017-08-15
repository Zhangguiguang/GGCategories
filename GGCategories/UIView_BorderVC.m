//
//  UIView_BorderVC.m
//  GGCategories
//
//  Created by 张贵广 on 2017/8/15.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "UIView_BorderVC.h"
#import "UIView+GGBorder.h"

@interface UIView_BorderVC ()
@property (nonatomic, strong) UIView *greenView;

@property (nonatomic, strong) UIView *blueView;

@end

@implementation UIView_BorderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addGrid:self.view];
    
    _greenView = [[UIView alloc] init];
    _greenView.backgroundColor = [UIColor greenColor];
    [_greenView gg_borderWithColor:[UIColor grayColor] width:3 edge:UIRectEdgeNone];
    [self.view addSubview:_greenView];
    
    _blueView = [[UIView alloc] init];
    _blueView.backgroundColor = [UIColor blueColor];
    [_blueView gg_borderWithColor:[UIColor grayColor] width:7 edge:UIRectEdgeNone];
    [self.view addSubview:_blueView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _greenView.frame = CGRectMake(100, 100, 50, 150);
    _blueView.frame = CGRectMake(200, 100, 100, 100);
    
    // 在视图布局固定之后，重新给edge赋值
    _greenView.gg_borderEdge = UIRectEdgeTop | UIRectEdgeRight;
    _blueView.gg_borderEdge = UIRectEdgeBottom | UIRectEdgeTop | UIRectEdgeRight;
}


- (void)addGrid:(UIView *)view {
    CGFloat widthView = view.frame.size.width;
    CGFloat heightView = view.frame.size.height;
    CGFloat size = 50;
    
    void (^addLineWidthRect)(CGRect rect) = ^(CGRect rect) {
        CALayer *layer = [[CALayer alloc] init];
        [view.layer addSublayer:layer];
        layer.frame = rect;
        layer.backgroundColor = [[UIColor redColor] CGColor];
    };
    
    for (int i=0; i<widthView; i+=size) {
        addLineWidthRect(CGRectMake(i, 0, 0.5, heightView));
    }
    for (int i=0; i<heightView; i+=size) {
        addLineWidthRect(CGRectMake(0, i, widthView, 0.5));
    }
}

@end
