//
//  UIWebView+GGLoad.h
//  ClubFactory
//
//  Created by 张贵广 on 2017/8/11.
//  Copyright © 2017年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (GGLoad)

- (void)gg_loadURLString:(NSString*)URLString;
- (void)gg_loadLocalHtmlFile:(NSString*)fileName;
- (void)gg_loadLocalHtmlFile:(NSString*)fileName inBundle:(NSBundle*)inBundle;

@end
