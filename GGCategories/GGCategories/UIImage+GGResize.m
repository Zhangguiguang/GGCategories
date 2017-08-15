//
//  UIImage+GGResize.m
//  GGCategories
//
//  Created by 张贵广 on 2017/8/15.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "UIImage+GGResize.h"

@implementation UIImage (GGResize)

- (UIImage *)gg_resizeToSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resizedImage;
}

- (UIImage *)gg_resizeToScale:(CGFloat)scale {
    CGSize newSize = CGSizeMake(self.size.width * scale, self.size.height * scale);
    return [self gg_resizeToSize:newSize];
}

@end
