//
//  STPBinPredictor.m
//  Stripe
//
//  Created by David Estes on 8/29/19.
//  Copyright © 2019 Stripe, Inc. All rights reserved.
//

#import "STPBinPredictor.h"
#import "STPBins.h"

@implementation STPBinPredictor {
    NSDictionary *_allBins;
}

- (instancetype)init {
    self = [super init];
    id json = [NSJSONSerialization JSONObjectWithData:[STP_BINS dataUsingEncoding:NSUTF8StringEncoding] options:(NSJSONReadingOptions)kNilOptions error:nil];
    if (json) {
        _allBins = (NSDictionary *)json;
    }
    return self;
}

- (NSString *)countryCodeForBin:(NSNumber *)bin {
    NSString *binString = [bin stringValue];
    if ([binString length] > 6) {
        binString = [binString substringToIndex:6];
    }
    for (NSString *country in _allBins) {
        NSArray<NSNumber *> *bins = _allBins[country];
        if ([self _binList:bins containsBin:bin]) {
            return country;
        }
    }
    return nil;
}

- (BOOL)_binList:(NSArray <NSNumber *>*)binList containsBin:(NSNumber *)bin {
    NSUInteger intBin = [bin integerValue];
    NSUInteger start = 0;
    NSUInteger end = 0;
    BOOL value = false;
    
    for (NSUInteger i = 0; i < [binList count]; i += 1) {
        NSUInteger offset = [[binList objectAtIndex:i] integerValue];
        end = start + offset;
        if (intBin >= start && intBin < end) {
            return value;
        }
        value = !value;
        start = end;
    }
    return false;
}

@end
