//
//  FloatViewController.m
//  TableViewFloat
//
//  Created by 李雪阳 on 2018/8/28.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import "FloatViewController.h"
#import "FloatHeader.h"
#import "GestureTableView.h"
#import "FDSlideBar.h"
#import "FloatContainerCell.h"
#import "FloatTableCell.h"
#import "FloatHeadView.h"

#define sliderHeight 49

@interface FloatViewController ()<UITableViewDelegate,UITableViewDataSource,FloatContainerCellDelegate>

@property (nonatomic,strong) GestureTableView *tableView;
@property (nonatomic,strong) FDSlideBar *sliderView;
@property (nonatomic,strong) FloatContainerCell *containerCell;

@property (nonatomic, assign) BOOL canScroll;

@end

@implementation FloatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"tableViewFloat";
    
    [self setTable];
    self.canScroll = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeScrollStatus) name:@"leaveTop" object:nil];
}

- (void)changeScrollStatus{
    self.canScroll = YES;
    self.containerCell.objectCanScroll = NO;
}

#pragma mark clickEvent
- (void)setTable{
    [self.view addSubview:self.tableView];
    FloatHeadView *headView=[FloatHeadView new];
    headView.goGathering = ^{
        NSLog(@"收款");
        
    };
    _tableView.tableHeaderView=headView;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==0) {//第一cell
            
        }else{//第二cell
            
        }
    }
}


#pragma mark ——————————UIScrollViewDelegate——————————
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView) {
        
        CGFloat bottomCellOffset = [self.tableView rectForSection:1].origin.y - (STATUS_HEIGHT+44);
        bottomCellOffset = floorf(bottomCellOffset);
        
        if (scrollView.contentOffset.y >= bottomCellOffset) {
            scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
            if (self.canScroll) {
                self.canScroll = NO;
                self.containerCell.objectCanScroll = YES;
            }
        }else{
            //子视图没到顶部
            if (!self.canScroll) {
                scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
            }
        }
    }
}
#pragma mark ——————————UIScrollViewDelegate——————————


#pragma mark ——————————FloatContainerCellDelegate——————————
- (void)containerScrollViewDidScroll:(UIScrollView *)scrollView{
    self.tableView.scrollEnabled = NO;
}

- (void)containerScrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSUInteger page = scrollView.contentOffset.x/SCREEN_WIDTH;
    [UIView animateWithDuration:0.5 animations:^{
        [self.sliderView selectSlideBarItemAtIndex:page];
    }];
    
    self.tableView.scrollEnabled = YES;
}
#pragma mark ——————————FloatContainerCellDelegate——————————

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        FloatTableCell *clientCell=[tableView dequeueReusableCellWithIdentifier:@"float"];
        if (clientCell==nil) {
            clientCell=[[[NSBundle mainBundle]loadNibNamed:@"FloatTableCell" owner:self options:nil]lastObject];
        }
        clientCell.clipsToBounds=YES;
        clientCell.selectionStyle=UITableViewCellSelectionStyleNone;
        clientCell.tag=indexPath.row;
        return clientCell;
    }
    FloatContainerCell *contain=[tableView dequeueReusableCellWithIdentifier:@"container"];
    contain=[[FloatContainerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"container"];
    contain.VC=self;
    self.containerCell=contain;
    contain.delegate=self;
    return contain;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 138;
    }
    return SCREEN_WINDOW_HEIGHT-sliderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01f;
    }
    return sliderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section==0) {
        return 10;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==1) {
        return self.sliderView;
    }
    return nil;
}


- (GestureTableView *)tableView{
    if (!_tableView) {
        _tableView=[[GestureTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];//group/plain都可
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.sectionFooterHeight=0;
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
    }
    return _tableView;
}



- (FDSlideBar *)sliderView{//滑块部分可任意替换
    if (!_sliderView) {
        NSArray *itemArr=@[@"本月收款排行榜",@"年度收款排行榜"];
        _sliderView = [[FDSlideBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, sliderHeight)];
        _sliderView.backgroundColor = [UIColor whiteColor];
        _sliderView.itemsWidth=SCREEN_WIDTH/itemArr.count;
        _sliderView.itemsTitle = itemArr;
        _sliderView.itemColor = [UIColor colorWithHexString:@"272829"];
        _sliderView.itemSelectedColor = [UIColor colorWithHexString:@"f2441c"];
        _sliderView.sliderColor = [UIColor colorWithHexString:@"f2441c"];
        [_sliderView slideBarItemSelectedCallback:^(NSUInteger idx) {
            [UIView animateWithDuration:0.5 animations:^{
                self.containerCell.isSelectIndex = YES;
                [self.containerCell.scrollView setContentOffset:CGPointMake(idx*SCREEN_WIDTH, 0) animated:YES];
            }];
        }];
    }
    return _sliderView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
