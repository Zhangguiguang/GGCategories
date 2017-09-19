//
//  UIViewController+GGTransition.h
//  ClubFactory
//
//  Created by 张贵广 on 2017/4/26.
//  Copyright © 2017年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CALayer (GGTransition)

- (void)gg_addTransitionDuration:(NSTimeInterval)duration type:(NSString *)type subtype:(NSString *)subtype;

@end

@interface UIViewController (GGTransition)

- (void)gg_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;
- (void)gg_presentViewController:(UIViewController *)vc animated:(BOOL)flag completion:(void (^)(void))completion;
- (void)gg_dismissCurrentAndPresentViewController:(UIViewController *)vc animated:(BOOL)flag completion:(void (^)(void))completion;

@end
