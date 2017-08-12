//
//  ViewController.m
//  GGCategories
//
//  Created by 张贵广 on 2017/8/12.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView+GGNewTab.h"

@interface ViewController () <UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc] init];
    _webView.backgroundColor = [UIColor redColor];
    _webView.delegate = self;
    [self.view addSubview:_webView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _webView.bounds = CGRectMake(0, 0, 300, 400);
    _webView.center = self.view.center;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSString *URLString = @"https://app.fromfactory.club/product_list";
    NSURL *URL = [NSURL URLWithString:URLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [_webView loadRequest:request];
}

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
}

@end
