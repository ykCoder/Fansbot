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
+(NSMutableAttributedString *)setRichText:(NSString *)str0 withFont:(CGFloat) size0 withColor:(UIColor *)color0 andOtherText:(NSString *)str1 withFont:(CGFloat) size1 withColor:(UIColor *)color1 atIndex:(NSUInteger)loc
{
    NSMutableString *sumStr=[[NSMutableString alloc]initWithString:str0];
    [sumStr insertString:str1 atIndex:loc];
    NSMutableAttributedString *richText = [[NSMutableAttributedString alloc] initWithString:sumStr];
    [richText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size0] range:NSMakeRange(0, sumStr.length)];
    [richText addAttribute:NSForegroundColorAttributeName value:color0 range:NSMakeRange(0, sumStr.length)];
    [richText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size1] range:NSMakeRange(loc, str1.length)];
    [richText addAttribute:NSForegroundColorAttributeName value:color1 range:NSMakeRange(loc, str1.length)];
    return richText;
    
}
@end
