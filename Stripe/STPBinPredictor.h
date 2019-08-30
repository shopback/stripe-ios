//
//  STPBinPredictor.h
//  Stripe
//
//  Created by David Estes on 8/29/19.
//  Copyright © 2019 Stripe, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STPBinPredictor : NSObject

- (NSString *)countryCodeForBin:(NSNumber *)bin;

@end

NS_ASSUME_NONNULL_END
