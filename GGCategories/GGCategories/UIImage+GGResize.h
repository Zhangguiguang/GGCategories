//
//  UIImage+GGResize.h
//  GGCategories
//
//  Created by 张贵广 on 2017/8/15.
//  Copyright © 2017年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GGResize)

- (UIImage *)gg_resizeToSize:(CGSize)size;
- (UIImage *)gg_resizeToScale:(CGFloat)scale;

@end
