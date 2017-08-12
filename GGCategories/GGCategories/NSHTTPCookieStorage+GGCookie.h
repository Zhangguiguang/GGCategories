//
//  NSHTTPCookieStorage+GGCookie.h
//  ClubFactory
//
//  Created by 张贵广 on 2017/8/11.
//  Copyright © 2017年 GG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSHTTPCookieStorage (GGCookie)

// https://www.example.com/
+ (void)gg_initCookieURLString:(NSString *)URLString;

+ (void)gg_setCookieName:(NSString *)name value:(NSString *)value;
+ (NSString *)gg_getCookieWithName:(NSString *)name;
+ (void)gg_deleteCookieWithName:(NSString *)name;

@end
