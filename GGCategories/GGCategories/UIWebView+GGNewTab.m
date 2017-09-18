//
//  UIWebView+GGNewTab.m
//  ClubFactory
//
//  Created by 张贵广 on 2017/8/11.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "UIWebView+GGNewTab.h"
#import "GGCategories.h"

@implementation UIWebView (GGNewTab)
static NSString * const GGNewTabScheme = @"ggnewtab";
static NSString *GGNewTabJSCode;
- (void)gg_injectAndExecuteNewTabJSCode {
    if (GGNewTabJSCode == nil) {
        NSBundle *bundle = [NSBundle bundleForClass:[GGCategories class]];
        NSString *path = [bundle pathForResource:@"GGNewTabModifyLinkTargets" ofType:@"js"];
        GGNewTabJSCode = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    }
    
    [self stringByEvaluatingJavaScriptFromString:GGNewTabJSCode];
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"GGIPhoneApp_ModifyLinkTargets('%@')", GGNewTabScheme]];
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"GGIPhoneApp_ModifyWindowOpen('%@')", GGNewTabScheme]];
}

- (NSURL *)gg_getNewTabURLFromRequest:(NSURLRequest *)request {
    NSURL *URL = [request URL];
    if ([[URL scheme] isEqualToString:GGNewTabScheme] == NO) {
        return nil;
    }
    
    NSString *URLString = [[URL resourceSpecifier] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *baseURLString = [self stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    URL = [NSURL URLWithString:URLString relativeToURL:baseURL];
    return URL;
}

@end
