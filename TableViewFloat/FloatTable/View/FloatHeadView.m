//
//  FloatHeadView.m
//  TableViewFloat
//
//  Created by 李雪阳 on 2018/8/28.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import "FloatHeadView.h"
#import "FloatHeader.h"


@interface FloatHeadView()

@property (nonatomic,strong) UILabel *debtPrice;
@property (nonatomic,strong) UILabel *debtNum;
@property (nonatomic,strong) UILabel *debtAvg;

@end

@implementation FloatHeadView

- (instancetype)init{
    self=[super init];
    if (self) {
        self.frame=CGRectMake(0, 0, SCREEN_WIDTH, 185);
        self.backgroundColor=[UIColor colorWithHexString:@"f0441c"];
        [self setView];
    }
    return self;
}

- (void)setView{
    UILabel *title=[CustomTools labelWithTitle:@"客户累计欠款(元)" Font:13 textColor:[UIColor whiteColor]];
    [self addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(20);
    }];
    
    _debtPrice=[CustomTools labelWithTitle:@"0.00" Font:30 textColor:[UIColor whiteColor]];
    _debtPrice.font=[UIFont boldSystemFontOfSize:30];
    [self addSubview:_debtPrice];
    [_debtPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(title.mas_bottom).offset(10);
    }];
    
    UILabel *seg=[UILabel new];
    seg.backgroundColor=[UIColor whiteColor];
    [self addSubview:seg];
    [seg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(_debtPrice.mas_bottom).offset(15);
        make.size.mas_equalTo(CGSizeMake(1, 15));
    }];
    
    _debtNum=[CustomTools labelWithTitle:@"欠款客户：0个" Font:13 textColor:[UIColor whiteColor]];
    [self addSubview:_debtNum];
    [_debtNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(seg);
        make.right.mas_equalTo(seg.mas_left).offset(-15);
    }];
    
    _debtAvg=[CustomTools labelWithTitle:@"平均欠款：0.00" Font:13 textColor:[UIColor whiteColor]];
    [self addSubview:_debtAvg];
    [_debtAvg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(seg);
        make.left.mas_equalTo(seg.mas_right).offset(15);
    }];
    
    UIButton *gather=[CustomTools buttonFromViewWithTitle:@"去收款" font:18 titleColor:[UIColor whiteColor] Selector:@selector(gatherClick) Target:self];
    gather.titleLabel.font=[UIFont boldSystemFontOfSize:18];
    gather.cornerRadius=34/2;
    gather.borderColor=[UIColor whiteColor];
    gather.borderWidth=1;
    [gather setTitleEdgeInsets:UIEdgeInsetsMake(0, -gather.imageView.image.size.width-15, 0, gather.imageView.image.size.width)];
    [gather setImageEdgeInsets:UIEdgeInsetsMake(0, [CustomTools rectTextWidthWithString:gather.titleLabel.text Font:18 TextHeight:15], 0, -[CustomTools rectTextWidthWithString:gather.titleLabel.text Font:18 TextHeight:15]-35)];
    [gather setImage:[UIImage imageNamed:@"规范_双箭头"] forState:UIControlStateNormal];
    [self addSubview:gather];
    [gather mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(seg.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(131, 34));
    }];
    
}

- (void)gatherClick{
    self.goGathering();
}

@end
