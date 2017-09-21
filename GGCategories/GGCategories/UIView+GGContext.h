//
//  UIView+GGContext.h
//  GGCategories
//
//  Created by 张贵广 on 2017/9/21.
//  Copyright © 2017年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GGContext)

@property (nonatomic, strong, readonly) UIViewController *ggViewController;
@property (nonatomic, strong, readonly) UINavigationController *ggNavigationController;
@property (nonatomic, strong, readonly) UITabBarController *ggTabBarController;

@end
