//
//  FirstRespone.m
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import "FirstRespone.h"

@implementation FirstRespone

@end

@implementation ParentItem


@end

@implementation ParentInfo

+ (nullable NSDictionary<NSString *, id> *)ng_modelContainerPropertyGenericClass {
    return @{ @"child" : [ParentInfo class]};
}
- (NSArray *)node_dataInfos{
    return [self.child copy];
}


@end

@implementation ParentSubInfo

+ (nullable NSDictionary<NSString *, id> *)ng_modelContainerPropertyGenericClass {
    return @{ @"child" : [ParentSubInfo class]};
}

@end

@implementation ChildInfo

+ (nullable NSDictionary<NSString *, id> *)ng_modelContainerPropertyGenericClass {
    return @{ @"child" : [ParentSubInfo class]};
}

@end
