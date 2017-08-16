//
//  UIImage+GGTint.h
//  GGCategories
//
//  Created by 张贵广 on 2017/8/15.
//  Copyright © 2017年 GG. All rights reserved.
//

// 设置image颜色为指定颜色
 
#import <UIKit/UIKit.h>

@interface UIImage (GGTint)

- (UIImage *)gg_tintColor:(UIColor *)tintColor;
- (UIImage *)gg_tintColor:(UIColor *)tintColor size:(CGSize)size;

- (UIImage *)gg_gradientTintColor:(UIColor *)tintColor;
- (UIImage *)gg_gradientTintColor:(UIColor *)tintColor size:(CGSize)size;

@end
