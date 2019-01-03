//
//  NGConfig.m
//  NGNetworkingSample
//
//  Created by guojian on 2017/4/10.
//  Copyright © 2017年 naijoug. All rights reserved.
//

#import "NGConfig.h"

@implementation NGConfig

- (instancetype)init {
    if (self = [super init]) {
        _ng_isLog = YES;   // 默认开启log
    }
    return self;
}

+ (instancetype)ng_config {
    return [[self alloc] init];
}

@end

@implementation NGConfig (NGChain)

- (NGConfig * (^)(NSString *))c_ng_baseUrlString {
    mWeakSelf
    return ^(NSString *baseUrlString) {
        weakSelf.ng_baseUrlString = baseUrlString;
        return self;
    };
}
- (NGConfig * (^)(NGNetwokLib))c_ng_networkLib {
    mWeakSelf
    return ^(NGNetwokLib networkLib) {
        weakSelf.ng_networkLib = networkLib;
        return self;
    };
}
- (NGConfig * (^)(BOOL))c_ng_isLog {
    mWeakSelf
    return ^(BOOL isLog) {
        weakSelf.ng_isLog = isLog;
        return self;
    };
}

@end
