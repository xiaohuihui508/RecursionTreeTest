//
//  FirstRespone.h
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NodeItem.h"
#import "BaseResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstRespone : BaseResponse

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger code;

@end

@interface ParentItem : NodeItem

@end

@interface ParentInfo : ParentItem

@property (nonatomic, strong) NSArray *child;//对应的子类item数组
@property (nonatomic, copy) NSString *collectionTime;
@property (nonatomic, copy) NSString *majorId;
@property (nonatomic, copy) NSString *majorName;//分类名称
@property (nonatomic, copy) NSString *majorType;
@property (nonatomic, copy) NSString *introduce;

@end

@interface ParentSubInfo : NodeItem

@property (nonatomic, strong) NSArray *child;
@property (nonatomic, copy) NSString *collectionTime;
@property (nonatomic, copy) NSString *majorId;
@property (nonatomic, copy) NSString *majorName;
@property (nonatomic, copy) NSString *majorType;
@property (nonatomic, copy) NSString *introduce;

@end

@interface ChildInfo : NodeItem

@property (nonatomic, strong) NSArray * child;
@property (nonatomic, copy) NSString *collectionTime;
@property (nonatomic, copy) NSString *majorId;
@property (nonatomic, copy) NSString *majorName;
@property (nonatomic, copy) NSString *majorType;
@property (nonatomic, copy) NSString *introduce;

@end

NS_ASSUME_NONNULL_END
