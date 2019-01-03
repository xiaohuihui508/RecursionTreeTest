//
//  NodeItem.m
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import "NodeItem.h"

@implementation NodeItem

- (BOOL)node_hasChild {
    return self.node_dataInfos && self.node_dataInfos.count > 0;
}

- (NSArray *)node_itemsWithAll:(BOOL)all {
    NSMutableArray *mArr = [NSMutableArray array];
    
    if (!self.node_isRoot) {//不是根节点
        [mArr addObject:self];
    }
    
    if (all || self.node_isOpen) { // 所有 || 展开节点
        // 遍历业务数据，递归添加子节点
        for (NodeItem *info in self.node_dataInfos) {
            [mArr addObjectsFromArray:[info node_itemsWithAll:all]];
        }
    }
    return [mArr copy];
}

- (NSArray *)node_allItems {
    return [self node_itemsWithAll:YES];
}

#pragma mark 展开收拢
- (NSArray *)node_openItems {
    return [self node_itemsWithAll:NO];
}

- (void)node_setChildNodeOpen:(BOOL)open {
    for (NodeItem *item in self.node_dataInfos) {
        item.node_isOpen = open;
    }
}

- (void)node_setAllNodeOpen:(BOOL)open {
    for (NodeItem *item in self.node_allItems) {
        item.node_isOpen = open;
    }
}

@end
