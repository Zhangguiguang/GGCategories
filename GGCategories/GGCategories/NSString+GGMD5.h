//
//  NSString+GGMD5.h
//  ClubFactory
//
//  Created by 张贵广 on 2017/4/23.
//  Copyright © 2017年 GG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GGMD5)

- (NSString *)gg_MD5String;

// self 为文件路径时，可计算出对应文件的MD5
- (NSString *)gg_fileMD5String;

@end
