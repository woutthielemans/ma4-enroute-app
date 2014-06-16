//
//  QuoteFactory.h
//  EnRoute12
//
//  Created by Wout Thielemans on 15/06/14.
//  Copyright (c) 2014 devine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quote.h"

@interface QuoteFactory : NSObject

+ (Quote *)createQuoteWithText:(NSString *)quotetext;

@end
