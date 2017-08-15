//
//  UIView+GGBorderLine.h
//  CALayer学习
//
//  Created by 张贵广 on 2017/7/27.
//  Copyright © 2017年 HZNU. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GGBorderZPosition) {
    GGBorderFront,
    GGBorderBehind
};

@interface UIView (GGBorder)

// 线条位置
@property (nonatomic, assign) UIRectEdge gg_borderEdge;

// 线条z坐标
@property (nonatomic, assign) GGBorderZPosition gg_borderZPosition;

// 线条颜色，默认0xe5e5e5
@property (nonatomic, strong) UIColor *gg_borderColor;

// 线条宽度，px为单位
@property (nonatomic, assign) NSInteger gg_borderWidth;

- (void)gg_borderWithColor:(UIColor *)color width:(NSInteger)width edge:(UIRectEdge)dege;
- (void)gg_updateBorders;

@end
