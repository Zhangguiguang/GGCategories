//
//  UIWebView+GGLoad.m
//  ClubFactory
//
//  Created by 张贵广 on 2017/8/11.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "UIWebView+GGLoad.h"
#import <objc/runtime.h>

@implementation UIWebView (GGLoad)

- (void)gg_loadURLString:(NSString *)URLString {
    NSURL *url = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self loadRequest:request];
}

- (void)gg_loadLocalHtmlFile:(NSString *)fileName {
    [self gg_loadLocalHtmlFile:fileName inBundle:[NSBundle mainBundle]];
}

- (void)gg_loadLocalHtmlFile:(NSString *)fileName inBundle:(NSBundle *)inBundle {
    NSString *filePath = [inBundle pathForResource:fileName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self loadRequest:request];
}

@end
