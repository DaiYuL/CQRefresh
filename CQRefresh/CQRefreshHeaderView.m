//
//  CQRefreshHeaderView.m
//  CQRefresh
//
//  Created by 超群 on 16/8/30.
//  Copyright © 2016年 超群. All rights reserved.
//

#import "CQRefreshHeaderView.h"

@interface CQRefreshHeaderView ()

@property (nonatomic, assign) CGFloat controlPointY;

@end

@implementation CQRefreshHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIColor *color = [UIColor groupTableViewBackgroundColor];
    [color set];
    UIBezierPath* aPath = [UIBezierPath bezierPath];
    aPath.lineWidth = 1.f;
    aPath.lineCapStyle = kCGLineCapRound;
    aPath.lineJoinStyle = kCGLineCapRound;
    [aPath moveToPoint:CGPointMake(0, 0)];
    [aPath addQuadCurveToPoint:CGPointMake(kScreen_width, 0) controlPoint:CGPointMake(kScreen_width/2, _controlPointY)];
    [aPath closePath];
    [aPath fill];
    [aPath stroke];
}

- (void)setRefreshProgress:(CGFloat )value {
    _controlPointY = value;
}

@end
