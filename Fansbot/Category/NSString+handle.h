//
//  NSString+handle.h
//  Fansbot
//
//  Created by 杨康 on 2020/11/16.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (handle)
+  (BOOL)isBlankString:(NSString *)aStr;
//设置富文本
+(NSMutableAttributedString *)setRichText:(NSString *)str0 withFont:(CGFloat) size0 withColor:(UIColor *)color0 andOtherText:(NSString *)str1 withFont:(CGFloat) size1 withColor:(UIColor *)color1 atIndex:(NSUInteger)loc;
@end

NS_ASSUME_NONNULL_END
