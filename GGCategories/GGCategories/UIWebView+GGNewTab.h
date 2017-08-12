//
//  UIWebView+GGNewTab.h
//  ClubFactory
//
//  Created by 张贵广 on 2017/8/11.
//  Copyright © 2017年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (GGNewTab) <UIWebViewDelegate>

/* 打开新tab页 步骤：
 1. 首先需要注入js，并执行js方法：
    a. 将target=_blank的a标签的链接加上ggnewtab:前缀；
    b. 修改window.open的行为，将要打开链接添加ggnewtab:前缀
 2. 在UIWebViewDelegate的 shouldStartLoadWithRequest 方法中，对request.URL做判断，如果包含ggnewtab:前缀，即打开新窗口
 */

// 注入并执行js的方法，在UIWebViewDelegate 方法webViewDidFinishLoad里调用
- (void)gg_injectAndExecuteNewTabJSCode;

// 根据request对象，取出新标签页的URL、如果有打开新标签的行为，否则会取得nil
- (NSURL *)gg_getNewTabURLFromRequest:(NSURLRequest *)request;

@end
