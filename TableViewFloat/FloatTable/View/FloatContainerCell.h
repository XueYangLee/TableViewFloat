//
//  FloatContainerCell.h
//  TableViewFloat
//
//  Created by 李雪阳 on 2018/8/28.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FloatContainerCellDelegate <NSObject>

@optional
- (void)containerScrollViewDidScroll:(UIScrollView *)scrollView;

- (void)containerScrollViewDidEndDecelerating:(UIScrollView *)scrollView;

@end



@interface FloatContainerCell : UITableViewCell

@property (nonatomic,strong) UIViewController *VC;
- (void)configScrollView;

@property (nonatomic, strong, readonly) UIScrollView *scrollView;

@property (nonatomic, assign) BOOL objectCanScroll;
@property (nonatomic, assign) BOOL isSelectIndex;

@property (nonatomic,weak) id<FloatContainerCellDelegate>delegate;

@end
