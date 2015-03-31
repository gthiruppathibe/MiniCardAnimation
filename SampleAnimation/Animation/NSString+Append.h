//
//  NSString+Append.h
//  ePrayer
//
//  Created by Thiruppathi Gandhi on 23/03/15.
//  Copyright (c) 2015 sri Divya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Append)


- (NSString *)stringByDeletingWordsFromStringToFit:(CGRect)rect
                                         withInset:(CGFloat)inset
                                         usingFont:(UIFont *)font;

@end
