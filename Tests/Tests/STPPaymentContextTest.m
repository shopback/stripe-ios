//
//  STPPaymentContextTest.m
//  StripeiOS Tests
//
//  Created by Yuki Tokuhiro on 12/16/19.
//  Copyright © 2019 Stripe, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "STPMocks.h"

@import Stripe;

@interface STPPaymentContext (Testing)
@property (nonatomic) STPAPIClient *apiClient;
@end


@interface STPPaymentContextTest : XCTestCase

@end

@implementation STPPaymentContextTest

- (void)testConfiguresPaymentContext {
    // Configure PaymentContext using [STPPaymentConfiguration sharedConfiguration]
    [STPPaymentConfiguration sharedConfiguration].publishableKey = @"publishableKey1";
    [STPPaymentConfiguration sharedConfiguration].stripeAccount = @"stripeAccount1";
    STPPaymentContext *context = [[STPPaymentContext alloc] initWithCustomerContext:[STPMocks staticCustomerContext]];
    XCTAssertEqualObjects(context.apiClient.publishableKey, @"publishableKey1");
    XCTAssertEqualObjects(context.apiClient.stripeAccount, @"stripeAccount1");

    // Configure PaymentContext using a STPPaymentConfiguration instance
    STPPaymentConfiguration *configuration = [[STPPaymentConfiguration alloc] init];
    configuration.publishableKey = @"publishableKey2";
    configuration.stripeAccount = @"stripeAccount2";
    context = [[STPPaymentContext alloc] initWithCustomerContext:[STPMocks staticCustomerContext] configuration:configuration theme:[STPTheme new]];
    XCTAssertEqualObjects(context.apiClient.publishableKey, configuration.publishableKey);
    XCTAssertEqualObjects(context.apiClient.stripeAccount, configuration.stripeAccount);
    
    // Configure PaymentContext using [STPAPIClient sharedClient]
    [STPAPIClient sharedClient].publishableKey = @"publishableKey3";
    context = [[STPPaymentContext alloc] initWithCustomerContext:[STPMocks staticCustomerContext]];
    XCTAssertEqualObjects(context.apiClient.publishableKey, @"publishableKey3");
}

@end
