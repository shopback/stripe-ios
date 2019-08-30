//
//  STPBinPredictorTest.m
//  StripeiOS Tests
//
//  Created by David Estes on 8/29/19.
//  Copyright © 2019 Stripe, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "STPBinPredictor.h"

@interface STPBinPredictorTest : XCTestCase
@end

@implementation STPBinPredictorTest

- (void)testLoad {
    [self measureBlock:^{
        STPBinPredictor *binPredictor = [[STPBinPredictor alloc] init];
        XCTAssertNotNil(binPredictor);
    }];
}

- (void)testMatches {
    STPBinPredictor *binPredictor = [[STPBinPredictor alloc] init];
    [self measureBlock:^{
        XCTAssertEqualObjects([binPredictor countryCodeForBin:@(414720)], @"US");
        XCTAssertEqualObjects([binPredictor countryCodeForBin:@(451223)], @"CA");
        XCTAssertEqualObjects([binPredictor countryCodeForBin:@(451223)], @"CA");
        XCTAssertEqualObjects([binPredictor countryCodeForBin:@(675940)], @"GB");
        XCTAssertEqualObjects([binPredictor countryCodeForBin:@(999999)], nil);
        XCTAssertEqualObjects([binPredictor countryCodeForBin:@(0)], nil);
    }];
}

@end
