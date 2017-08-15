
#import "UIImage+GGTint.h"

@implementation UIImage (GGTint)

- (UIImage *)gg_tintColor:(UIColor *)tintColor {
    return [self gg_imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn size:self.size];
}
- (UIImage *)gg_tintColor:(UIColor *)tintColor size:(CGSize)size {
    return [self gg_imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn size:size];
}

- (UIImage *)gg_gradientTintColor:(UIColor *)tintColor {
    return [self gg_imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay size:self.size];
}
- (UIImage *)gg_gradientTintColor:(UIColor *)tintColor size:(CGSize)size {
    return [self gg_imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay size:size];
}

- (UIImage *)gg_imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode size:(CGSize)size {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, size.width, size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintedImage;
}

@end
