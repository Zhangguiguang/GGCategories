//
//  NSHTTPCookieStorage+GGCookie.m
//  ClubFactory
//
//  Created by 张贵广 on 2017/8/11.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "NSHTTPCookieStorage+GGCookie.h"

@implementation NSHTTPCookieStorage (GGCookie)

static NSURL *GGCookieURL;
static NSString *GGCookieDomain;
+ (void)gg_initCookieURLString:(NSString *)URLString {
    GGCookieURL = [NSURL URLWithString:URLString];
    GGCookieDomain = [GGCookieURL host];
}

+ (void)gg_setCookieName:(NSString *)name value:(NSString *)value {
    if (value == nil || name == nil) {
        return;
    }
    
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    [cookieProperties setObject:name forKey:NSHTTPCookieName];
    [cookieProperties setObject:value forKey:NSHTTPCookieValue];
    [cookieProperties setObject:GGCookieDomain forKey:NSHTTPCookieDomain];
    [cookieProperties setObject:@"/" forKey:NSHTTPCookiePath];
    [cookieProperties setObject:@"0" forKey:NSHTTPCookieVersion];
    [cookieProperties setObject:[[NSDate date] dateByAddingTimeInterval:3600*24*30] forKey:NSHTTPCookieExpires];
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
    
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
}

+ (NSString *)gg_getCookieWithName:(NSString *)name {
    NSHTTPCookie *cookie = [self gg_getCookieObjectWithName:name];
    return [cookie value];
}

+ (void)gg_deleteCookieWithName:(NSString *)name {
    NSHTTPCookie *cookie = [self gg_getCookieObjectWithName:name];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
}

// private function
+ (NSHTTPCookie *)gg_getCookieObjectWithName:(NSString *)name {
    NSArray<NSHTTPCookie *> *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:GGCookieURL];
    for (NSHTTPCookie *cookie in cookies) {
        if ([cookie.name isEqualToString:name]) {
            return cookie;
        }
    }
    return nil;
}

@end
