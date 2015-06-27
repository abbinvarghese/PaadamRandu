//
//  NSMutableArray+PRMutableArray.m
//  PaadamRandu
//
//  Created by Abbin Varghese on 27/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import "NSMutableArray+PRMutableArray.h"

@implementation NSMutableArray (PRMutableArray)

- (void)shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end
