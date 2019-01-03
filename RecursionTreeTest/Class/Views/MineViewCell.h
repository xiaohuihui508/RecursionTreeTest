//
//  MineViewCell.h
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString * const KIDMineViewCell = @"KIDMineViewCell";
static CGFloat KHeightMineViewCell = 40;

@interface MineViewCell : UITableViewCell

@property (nonatomic, copy) void (^openFitsrBlock)(ParentInfo*classInfo);
@property (nonatomic, copy) void (^tapFirstBlock)(ParentInfo*classInfo);
@property (nonatomic, strong) ParentInfo *parentInfo;

@end

NS_ASSUME_NONNULL_END
