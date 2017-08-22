//
//  UIView+GGBorderLine.m
//  CALayer学习
//
//  Created by 张贵广 on 2017/7/27.
//  Copyright © 2017年 HZNU. All rights reserved.
//

#import "UIView+GGBorder.h"
#import <objc/runtime.h>

@implementation UIView (GGBorderLine)

#pragma mark - public function
- (void)gg_borderWithColor:(UIColor *)color width:(NSInteger)width edge:(UIRectEdge)dege {
    objc_setAssociatedObject(self, &ggBorderColorKey, color, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, &ggBorderWidthKey, @(width), OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(self, &ggBorderEdgeKey, @(dege), OBJC_ASSOCIATION_RETAIN);
    [self gg_updateBorders];
}

- (void)gg_updateBorders {
    // 删除之前添加的边
    [self.layer.sublayers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(CALayer * layer, NSUInteger idx, BOOL *stop) {
        if ([layer.name hasPrefix:@"ggline"]) {
            [layer removeFromSuperlayer];
        }
    }];
    
    // 重新添加边
    UIRectEdge lineEdges = self.gg_borderEdge;
    while (lineEdges != UIRectEdgeNone) {
        CALayer *line = [[CALayer alloc] init];
        if (self.gg_borderZPosition == GGBorderFront) {
            [self.layer addSublayer:line];
        } else {
            [self.layer insertSublayer:line atIndex:0];
        }
        UIRectEdge edge = [self gg_updateLine:line toEdge:lineEdges];
        line.name = [NSString stringWithFormat:@"ggline%lu", (unsigned long)edge];
        lineEdges -= edge;
    }
}

#pragma mark - private function
/* 更新某条线到edge
 @return 最后只能将line设置到指定的单一位置，并返回该位置
 */
- (UIRectEdge)gg_updateLine:(CALayer *)line toEdge:(UIRectEdge)edge {
    line.backgroundColor = self.gg_borderColor.CGColor;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat lineWidth = self.gg_borderWidth * 1.0 / UIScreen.mainScreen.scale;
    if (edge & UIRectEdgeTop) {
        line.frame = CGRectMake(0, 0, width, lineWidth);
        return UIRectEdgeTop;
    } else if (edge & UIRectEdgeLeft) {
        line.frame = CGRectMake(0, 0, lineWidth, height);
        return UIRectEdgeLeft;
    } else if (edge & UIRectEdgeBottom) {
        line.frame = CGRectMake(0, height-lineWidth, width, lineWidth);
        return UIRectEdgeBottom;
    } else if (edge & UIRectEdgeRight) {
        line.frame = CGRectMake(width-lineWidth, 0, lineWidth, height);
        return UIRectEdgeRight;
    }
    return 0;
}

#pragma mark - getter setter
static void *ggBorderEdgeKey = &ggBorderEdgeKey;
static void *ggBorderZPositionKey = &ggBorderZPositionKey;
static void *ggBorderColorKey = &ggBorderColorKey;
static void *ggBorderWidthKey = &ggBorderWidthKey;

- (void)setGg_borderEdge:(UIRectEdge)gg_borderEdge {
    objc_setAssociatedObject(self, &ggBorderEdgeKey, @(gg_borderEdge), OBJC_ASSOCIATION_RETAIN);
    [self gg_updateBorders];
}
- (UIRectEdge)gg_borderEdge {
    NSNumber *gg_borderEdge = objc_getAssociatedObject(self, &ggBorderEdgeKey);
    return [gg_borderEdge unsignedIntegerValue];
}

- (void)setGg_borderZPosition:(GGBorderZPosition)gg_borderZPosition {
    objc_setAssociatedObject(self, &ggBorderZPositionKey, @(gg_borderZPosition), OBJC_ASSOCIATION_RETAIN);
    [self gg_updateBorders];
}
- (GGBorderZPosition)gg_borderZPosition {
    NSNumber *gg_borderZPosition = objc_getAssociatedObject(self, &ggBorderZPositionKey);
    return [gg_borderZPosition integerValue];
}

- (void)setGg_borderColor:(UIColor *)gg_borderColor {
    objc_setAssociatedObject(self, &ggBorderColorKey, gg_borderColor, OBJC_ASSOCIATION_RETAIN);
    [self gg_updateBorders];
}
- (UIColor *)gg_borderColor {
    UIColor *gg_borderColor = objc_getAssociatedObject(self, &ggBorderColorKey);
    if (!gg_borderColor) {
        UIColor *defaultColor = [UIColor colorWithRed:(0xe5/255.0) green:(0xe5/255.0) blue:(0xe5/255.0) alpha:1];
        objc_setAssociatedObject(self, &ggBorderColorKey, defaultColor, OBJC_ASSOCIATION_RETAIN);
        return defaultColor;
    }
    return gg_borderColor;
}

- (void)setGg_borderWidth:(NSInteger)gg_borderWidth {
    objc_setAssociatedObject(self, &ggBorderWidthKey, @(gg_borderWidth), OBJC_ASSOCIATION_RETAIN);
    [self gg_updateBorders];
}
- (NSInteger)gg_borderWidth {
    NSNumber *gg_borderWidth = objc_getAssociatedObject(self, &ggBorderWidthKey);
    return [gg_borderWidth integerValue];
}

@end
