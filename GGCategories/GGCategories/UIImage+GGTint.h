
// 设置image颜色为指定颜色
 
#import <UIKit/UIKit.h>

@interface UIImage (GGTint)

- (UIImage *)gg_tintColor:(UIColor *)tintColor;
- (UIImage *)gg_tintColor:(UIColor *)tintColor size:(CGSize)size;

- (UIImage *)gg_gradientTintColor:(UIColor *)tintColor;
- (UIImage *)gg_gradientTintColor:(UIColor *)tintColor size:(CGSize)size;

@end
