//
//  UIView+GGContext.m
//  GGCategories
//
//  Created by 张贵广 on 2017/9/21.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "UIView+GGContext.h"

@implementation UIView (GGContext)

#pragma mark - private function
- (id)appointedViewControllerWithClass:(Class)class {
    for (UIView *next = self.superview; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:class]) {
            return nextResponder;
        }
    }
    return nil;
}

#pragma mark - getter setter
- (UIViewController *)ggViewController {
    return [self appointedViewControllerWithClass:[UIViewController class]];
}
- (UINavigationController *)ggNavigationController {
    return [self appointedViewControllerWithClass:[UINavigationController class]];
}
- (UITabBarController *)ggTabBarController {
    return [self appointedViewControllerWithClass:[UITabBarController class]];
}

@end
