//
//  MineVC.m
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import "MineVC.h"

#import "MineViewCell.h"
#import "FirstRespone.h"

@interface MineVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ParentItem  *parentItem;

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUptableView];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(@50);
        make.top.bottom.left.right.equalTo(@0);
    }];
    [self updateJosn];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(ParentItem *)parentItem{
    if (!_parentItem) {
        _parentItem=[[ParentItem alloc]init];
        _parentItem.node_isOpen=YES;
        _parentItem.node_isRoot=YES;
    }
    return _parentItem;
}
-(void)updateJosn{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"json" ofType:@"txt"];
    
    NSString *content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    FirstRespone *respone = [[NGResponse ng_response].c_ng_responseType(NGResponseTypeModel).c_ng_responseClass([FirstRespone class]) ng_paraseResponse:content];
    self.parentItem.node_dataInfos = [[NGResponse ng_response].c_ng_responseType(NGResponseTypeModel).c_ng_responseClass([ParentInfo class]) ng_paraseResponse:respone.data];
    NSLog(@"%ld",self.parentItem.node_dataInfos.count);
    //设置展开所有子类 不需要就注释这行代码
    [self.parentItem node_setAllNodeOpen:NO];
    
    
}
-(void)setUptableView{
    // 添加table
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor   = [UIColor whiteColor];
    
    tableView.delegate          = self;
    tableView.dataSource        = self;
    [tableView registerClass:[MineViewCell class] forCellReuseIdentifier: KIDMineViewCell];
    self.tableView = tableView;
    
}
#pragma mark UITableView delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.parentItem.node_openItems.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return KHeightMineViewCell;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MineViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KIDMineViewCell];
    ParentInfo *info = [self.parentItem.node_openItems objectAtIndex:indexPath.row];
    cell.parentInfo = info;
    mWeakSelf
    cell.openFitsrBlock = ^(ParentInfo *classInfo){
        [weakSelf.tableView reloadData];
    };
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ParentInfo *info=[self.parentItem.node_openItems objectAtIndex:indexPath.row];
    NSLog(@"当前点击的===%@", info.majorName);
}

@end
