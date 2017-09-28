//
//  UIViewController+GGTransition.m
//  ClubFactory
//
//  Created by 张贵广 on 2017/4/26.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "UIViewController+GGTransition.h"
#import <objc/runtime.h>

@implementation CALayer (GGTransition)

- (void)gg_addTransitionDuration:(NSTimeInterval)duration type:(NSString *)type subtype:(NSString *)subtype {
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.type = type;
    transition.subtype = subtype;
    [self addAnimation:transition forKey:nil];
}

@end

@interface UIViewController ()
@property (nonatomic, strong) UIViewController *ggPresentingVC;
@end

@implementation UIViewController (GGTransition)

- (void)gg_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    if (self.ggPresentingVC) {
        [self.ggPresentingVC dismissViewControllerAnimated:flag completion:nil];
    } else {
        [self dismissViewControllerAnimated:flag completion:nil];
    }
}

- (void)gg_presentViewController:(UIViewController *)vc animated:(BOOL)flag completion:(void (^)(void))completion {
    [vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:vc animated:flag completion:completion];
}

- (void)gg_dismissCurrentAndPresentViewController:(UIViewController *)vc animated:(BOOL)flag completion:(void (^)(void))completion {
    [vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:vc animated:flag completion:completion];
    vc.ggPresentingVC = self.ggPresentingVC ? : self.presentingViewController;
}

#pragma mark - setter getter
static void *ggPresentingVCKey = &ggPresentingVCKey;
- (void)setGgPresentingVC:(UIViewController *)ggPresentingVC {
    objc_setAssociatedObject(self, &ggPresentingVCKey, ggPresentingVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIViewController *)ggPresentingVC {
    return objc_getAssociatedObject(self, &ggPresentingVCKey);
}

@end

