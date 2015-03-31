//
//  NSString+Append.m
//  ePrayer
//
//  Created by Thiruppathi Gandhi on 23/03/15.
//  Copyright (c) 2015 sri Divya. All rights reserved.
//

#import "NSString+Append.h"

@implementation NSString (Append)


- (NSString *)stringByDeletingWordsFromStringToFit:(CGRect)rect
                                         withInset:(CGFloat)inset
                                         usingFont:(UIFont *)font
{
    NSString *result = [self copy];
    CGSize maxSize = CGSizeMake(rect.size.width  - (inset * 2), FLT_MAX);
    if (!font) font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    CGRect boundingRect = [result boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font, } context:nil];
    CGSize size = boundingRect.size;
    NSRange range;
    
    if (rect.size.height < size.height)
        while (rect.size.height < size.height) {
            
            range = [result rangeOfString:@" "
                                  options:NSBackwardsSearch];
            
            if (range.location != NSNotFound && range.location > 0 ) {
                result = [result substringToIndex:range.location];
            } else {
                result = [result substringToIndex:result.length - 1];
            }
            
            if (!font) font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
            CGRect boundingRect = [result boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font, } context:nil];
            size = boundingRect.size;
        }
    
    return result;
}


@end
