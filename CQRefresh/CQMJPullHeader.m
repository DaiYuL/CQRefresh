//
//  CQMJPullHeader.m
//  CQRefresh
//
//  Created by 超群 on 16/8/31.
//  Copyright © 2016年 超群. All rights reserved.
//

#import "CQMJPullHeader.h"
#import "CQRefreshHeaderView.h"

@interface CQMJPullHeader ()
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) CQRefreshHeaderView* refreshHeaderView;
@property (weak, nonatomic) UIImageView* refreshImageView;

@end

@implementation CQMJPullHeader

#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 50;
    self.backgroundColor = [UIColor whiteColor];
    
    CQRefreshHeaderView* haderBackImageView = [[CQRefreshHeaderView alloc]initWithFrame:CGRectZero];
    [self addSubview:haderBackImageView];
    self.refreshHeaderView = haderBackImageView;
    
    UIImageView* imageV = [[UIImageView alloc]init];
    imageV.image = [UIImage imageNamed:@"refresh_head"];
    [imageV setAnimationDuration:2];
    [self addSubview:imageV];
    self.refreshImageView = imageV;
    
}
#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    self.label.frame = self.bounds;
    self.refreshImageView.frame =  CGRectMake((self.bounds.size.width - 30)/2, 3, 30, 40);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    if (self.scrollView.mj_offsetY < 0) {
        self.refreshHeaderView.frame = CGRectMake(0, self.scrollView.mj_offsetY + self.mj_h + NAVBAR_HEIGHT, self.bounds.size.width, fabs(self.scrollView.mj_offsetY));
        [self.refreshHeaderView setRefreshProgress:fabs(self.scrollView.mj_offsetY + NAVBAR_HEIGHT) *2 - 15];
        [self.refreshHeaderView setNeedsDisplay];
    }
    [super scrollViewContentOffsetDidChange:change];
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            [self.refreshImageView stopAnimating];
            self.refreshImageView.image = [UIImage imageNamed:@"refresh_head"];
            break;
        case MJRefreshStatePulling:
            self.refreshImageView.image = [UIImage imageNamed:@"refresh_head_2"];
            [self.refreshImageView stopAnimating];
            break;
        case MJRefreshStateRefreshing:
            [self.refreshImageView setAnimationImages:@[[UIImage imageNamed:@"refresh_head_3"],[UIImage imageNamed:@"refresh_head_4"]]];
            [self.refreshImageView startAnimating];
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
}

@end
