//
//  UIWebView+GGProperty.m
//  ClubFactory
//
//  Created by 张贵广 on 2017/8/11.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "UIWebView+GGProperty.h"

@implementation UIWebView (GGProperty)

- (NSString *)gg_title {
    return [self stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (NSURL *)gg_url {
    NSString *location = [self stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    if (location) {
        return [NSURL URLWithString:location];
    }
    return nil;
}

@end
