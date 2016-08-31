//
//  CQMJPullHeader.h
//  CQRefresh
//
//  Created by 超群 on 16/8/31.
//  Copyright © 2016年 超群. All rights reserved.
//

#import <MJRefresh/MJRefresh.h>

@interface CQMJPullHeader : MJRefreshHeader
/**
 *  应用的界面是否有导航
 *  TODO: 应用的界面是否有导航
 */
@property (nonatomic, assign, getter=navIs) BOOL nav;

@end
