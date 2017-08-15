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
    [self dismissViewControllerAnimated:NO completion:completion];
}

- (void)gg_presentViewController:(UIViewController *)vc animated:(BOOL)flag completion:(void (^)(void))completion {
    if (flag) {
        [self.view.window.layer gg_addTransitionDuration:0.25 type:nil subtype:nil];
    }
    [self presentViewController:vc animated:NO completion:completion];
}

@end
