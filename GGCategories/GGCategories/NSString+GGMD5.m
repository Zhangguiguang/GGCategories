//
//  NSString+GGMD5.m
//  ClubFactory
//
//  Created by 张贵广 on 2017/4/23.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "NSString+GGMD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (GGMD5)

- (NSString *)gg_MD5String {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH] = {0};
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X", result[i]];
    }
    return ret;
}

- (NSString *)gg_fileMD5String {
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:self];
    if(handle == nil) {
        return nil;
    }
    
    CC_MD5_CTX md5;
    CC_MD5_Init(&md5);
    NSData* fileData = [handle readDataOfLength:256];
    while([fileData length]) {
        CC_MD5_Update(&md5, [fileData bytes], (CC_LONG)[fileData length]);
        fileData = [handle readDataOfLength:256];
    }
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH] = {0};
    CC_MD5_Final(digest, &md5);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for (int i=0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", digest[i]];
    }
    return ret;
}

@end
