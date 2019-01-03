//
//  NSObject+NGModel.m
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import "NSObject+NGModel.h"

@interface NSObject (_NGModel)<YYModel>

@end
@implementation NSObject (_NGModel)

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    if ([self respondsToSelector:@selector(ng_modelCustomPropertyMapper)]) {
        return [self ng_modelCustomPropertyMapper];
    }
    return nil;
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    if ([self respondsToSelector:@selector(ng_modelContainerPropertyGenericClass)]) {
        return [self ng_modelContainerPropertyGenericClass];
    }
    return nil;
}
+ (NSArray<NSString *> *)modelPropertyBlacklist {
    if ([self respondsToSelector:@selector(ng_modelPropertyBlacklist)]) {
        return [self ng_modelPropertyBlacklist];
    }
    return nil;
}

@end

@implementation NSObject (NGModel)

+ (instancetype)ng_modelWithJSON:(id)json {
    return [self yy_modelWithJSON:json];
}

- (id)ng_modelToJSONObject {
    return [self yy_modelToJSONObject];
}
- (NSString *)ng_modelToJSONString {
    return [self yy_modelToJSONString];
}
- (NSData *)ng_modelToJSONData {
    return [self yy_modelToJSONData];
}

@end

@implementation NSArray (NGModel)

+ (NSArray *)ng_modelArrayWithClass:(Class)cls json:(id)json {
    return [self yy_modelArrayWithClass:cls json:json];
}

@end

