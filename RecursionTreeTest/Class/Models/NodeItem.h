//
//  NodeItem.h
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NodeItem : NSObject

/**
 * 是否是Root节点
 **/
@property (nonatomic, assign) BOOL node_isRoot;
/**
 * 是否有子节点
 **/
@property (nonatomic, assign) BOOL node_hasChild;
/**
 * 是否有Footer节点
 **/
@property (nonatomic, assign) BOOL node_hasFooter;

/**
 * 子节点对应的业务数据 --》 需要继承NodeItem
 */
@property (nonatomic, strong) NSArray *node_dataInfos;

/**
 * 返回items -> [NodeItem]
 *
 * all : YES -> 返回所有子节点  NO -> 返回所有展开子节点
 */
- (NSArray *)node_itemsWithAll:(BOOL)all;

/** 所有子节点 -> [NodeItem] */
@property (nonatomic, assign, readonly) NSArray *node_allItems;

#pragma mark -- 展开收拢
/** 展开的子节点 -> [NodeItem] */
@property (nonatomic, strong, readonly) NSArray *node_openItems;

/** 是否展开 */
@property (nonatomic, assign) BOOL node_isOpen;

/**
 * 设置子Node 展开收拢
 */
- (void)node_setChildNodeOpen:(BOOL)open;
/**
 * 设置 所有 子Node 展开收拢
 */
- (void)node_setAllNodeOpen:(BOOL)open;

#pragma mark -- 选择
/** 是否选中 */
@property (nonatomic, assign) BOOL node_isSelected;

#pragma mark -- 编辑
/** 是否编辑状态 */
@property (nonatomic, assign) BOOL node_isEdit;


@end

NS_ASSUME_NONNULL_END
