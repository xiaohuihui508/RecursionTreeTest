//
//  MineViewCell.m
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import "MineViewCell.h"
#import "UIImage+DMExtension.h"

@interface MineViewCell()

@property (nonatomic, strong) UILabel  *classNameLabel;
@property (nonatomic, strong) UIImageView *openImageView;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *lineView;

@end
@implementation MineViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.contentView.backgroundColor = [UIColor colorWithRed:243 green:243 blue:243 alpha:1];
        [self setUpView];
    }
    return self;
}
- (void)setParentInfo:(ParentInfo *)parentInfo{
    if (_parentInfo != parentInfo) {
        _parentInfo = parentInfo;
    }
    
    self.classNameLabel.text = parentInfo.majorName;
    
    CGFloat left = 0.0;;
    switch (parentInfo.majorId.length) {
        case 2:{
            left = 0;
        }
            
            break;
        case 4:{
            left = 10;
        }
            
            break;
        case 6:{
            left = 20;
        }
            break;
        default:
            break;
    }
    
    [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(@0);
        make.left.equalTo(@(left));
    }];
    if (self.parentInfo.node_isOpen) {
        UIImage*image = [UIImage dm_imageWithName:@"ic_food_down" isScale:YES scale:0.1];
        self.openImageView.image=image;
    } else {
        UIImage*image = [UIImage dm_imageWithName:@"ic_food_right" isScale:YES scale:0.1];
        self.openImageView.image = image;
    }
    self.openImageView.hidden = parentInfo.child.count == 0 ? YES : NO;
    
}
- (void)setUpView{
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
        
    }];
    [self.bgView addSubview:self.classNameLabel];
    [self.classNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    [self.bgView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.right.bottom.equalTo(@0);
    }];
    [self.bgView addSubview:self.openImageView];
    [self.openImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.classNameLabel.mas_right).offset(10);
        make.height.with.equalTo(@25);
    }];
}
- (UILabel *)classNameLabel{
    if (!_classNameLabel) {
        _classNameLabel = [[UILabel alloc] init];
        _classNameLabel.font = [UIFont systemFontOfSize:18];
        _classNameLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    }
    return _classNameLabel;
}

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor redColor];
    }
    return _bgView;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor purpleColor];
    }
    return _lineView;
}
- (UIImageView *)openImageView{
    if (!_openImageView) {
        _openImageView = [[UIImageView alloc]init];
        UIImage *image = [UIImage dm_imageWithName:@"ic_food_right" isScale:YES scale:0.1];
        
        _openImageView.image = image;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openButtonAction)];
        _openImageView.userInteractionEnabled = YES;
        [_openImageView addGestureRecognizer:tap];
    }
    return _openImageView;
}
- (void)openButtonAction{
    
    self.parentInfo.node_isOpen=!self.parentInfo.node_isOpen;
    !self.openFitsrBlock?:self.openFitsrBlock(self.parentInfo);
}

@end
