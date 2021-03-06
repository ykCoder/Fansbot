//
//  NSString+handle.m
//  Fansbot
//
//  Created by 杨康 on 2020/11/16.
//

#import "NSString+handle.h"

@implementation NSString (handle)
+  (BOOL)isBlankString:(NSString *)aStr {
    if (aStr == nil || aStr == NULL) {
        
        return YES;
    }
    //字符串格式化的会是第一种情况
    if ([aStr isEqualToString:@"(null)"]||[aStr isEqualToString:@"<null>"]||[aStr isEqualToString:@"null"])
    {
        return YES;
    }
    if (!aStr) {
        return YES;
    }
    if ([aStr isKindOfClass:[NSNull class]]) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}
@end
