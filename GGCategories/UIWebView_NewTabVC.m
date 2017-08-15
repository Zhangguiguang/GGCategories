//
//  UIWebView_NewTabVC.m
//  GGCategories
//
//  Created by 张贵广 on 2017/8/15.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "UIWebView_NewTabVC.h"
#import "UIWebView+GGNewTab.h"

@interface UIWebView_NewTabVC () <UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation UIWebView_NewTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc] init];
    _webView.backgroundColor = [UIColor grayColor];
    _webView.delegate = self;
    [self.view addSubview:_webView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _webView.frame = self.view.frame;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSString *URLString = @"https://app.fromfactory.club/product_list";
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [_webView loadRequest:request];
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *URL = [webView gg_getNewTabURLFromRequest:request];
    if (URL) {
        NSLog(@"打开新标签 ： %@", URL.absoluteString);
        return NO;
    }
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [webView gg_injectAndExecuteNewTabJSCode];
    NSLog(@"脚本已注入，可以打开新标签了");
}


@end
