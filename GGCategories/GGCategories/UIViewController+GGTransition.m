//
//  UIViewController+GGTransition.m
//  ClubFactory
//
//  Created by 张贵广 on 2017/4/26.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "UIViewController+GGTransition.h"

@implementation CALayer (GGTransition)

- (void)gg_addTransitionDuration:(NSTimeInterval)duration type:(NSString *)type subtype:(NSString *)subtype {
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.type = type;
    transition.subtype = subtype;
    [self addAnimation:transition forKey:nil];
}

@end

@implementation UIViewController (GGTransition)

- (void)gg_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    if (flag) {
        [self.view.window.layer gg_addTransitionDuration:0.25 type:nil subtype:nil];
    }
    if (self.ggPresentingVC) {
        [self.ggPresentingVC dismissViewControllerAnimated:NO completion:nil];
    } else {
        [self dismissViewControllerAnimated:NO completion:nil];
    }
    //[self dismissViewControllerAnimated:NO completion:completion];
}

- (void)gg_presentViewController:(UIViewController *)vc animated:(BOOL)flag completion:(void (^)(void))completion {
    if (flag) {
        [self.view.window.layer gg_addTransitionDuration:0.25 type:nil subtype:nil];
    }
    [self presentViewController:vc animated:NO completion:completion];
}

static void *ggPresentingVCKey = &ggPresentingVCKey;
- (void)setGgPresentingVC:(UIViewController *)ggPresentingVC {
    objc_setAssociatedObject(self, &ggPresentingVCKey, ggPresentingVC, OBJC_ASSOCIATION_RETAIN);
}
- (UIViewController *)ggPresentingVC {
    return objc_getAssociatedObject(self, &ggPresentingVCKey);
}

@end
