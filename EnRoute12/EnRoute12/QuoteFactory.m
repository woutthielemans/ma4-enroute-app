//
//  QuoteFactory.m
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import "QuoteFactory.h"

@implementation QuoteFactory

+ (Quote *)createQuoteWithText:(NSString *)quotetext
{
    Quote *quote = [[Quote alloc] init];
    quote.quotetext = quotetext;
    return quote;
}

@end
