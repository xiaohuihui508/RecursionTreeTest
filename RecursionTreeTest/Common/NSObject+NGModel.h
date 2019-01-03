//
//  NSObject+NGModel.h
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NGModel <NSObject>

@optional
/**
 * model <-> JSON 自定义字段映射
 *
 * @{ @"nid" : @"id" };
 */
+ (nullable NSDictionary<NSString *,id> *)ng_modelCustomPropertyMapper;
/**
 * model <-> JSON Array中Model Class映射
 *
 * @{ @"books" : [BookInfo class] };
 */
+ (nullable NSDictionary<NSString *, id> *)ng_modelContainerPropertyGenericClass;
/**
 * model <-> JSON 中忽略的字段
 *
 * @[@"book"];
 */
+ (nullable NSArray<NSString *> *)ng_modelPropertyBlacklist;

@end


@interface NSObject (NGModel)<NGModel>

/**
 * JSON转Model
 *
 * @param json JSON数据( NSDictionary|NSArray、NSString、NSData )
 */
+ (nullable instancetype)ng_modelWithJSON:(nullable id)json;

/**
 * Model转JSON ( NSDictionary|NSArray )
 */
- (nullable id)ng_modelToJSONObject;
/**
 *  Model转JSON String
 */
- (nullable NSString *)ng_modelToJSONString;
/**
 *  Model转JSON Data
 */
- (nullable NSData *)ng_modelToJSONData;


@end

@interface NSArray (NGModel)

/**
 *  JSON数组转Model数组
 */
+ (nullable NSArray *)ng_modelArrayWithClass:(nullable Class)cls json:(nullable id)json;

@end
